class Status < ActiveRecord::Base
  # include HTTP request helpers
  include Networkable

  RELEASES_URL = "https://api.github.com/repos/articlemetrics/lagotto/releases"

  before_create :collect_status_info, :create_uuid

  default_scope { order("status.created_at DESC") }

  def self.per_page
    1000
  end

  def to_param
    uuid
  end

  def collect_status_info
    self.works_count = Work.tracked.count
    self.works_new_count = Work.tracked.last_x_days(0).count
    self.events_count = RetrievalStatus.joins(:source).where("state > ?", 0)
      .where("name != ?", "relativemetric").sum(:total)
    self.responses_count = ApiResponse.total(1).count
    self.requests_count = ApiRequest.total(1).count
    self.requests_average = ApiRequest.total(1).average("duration").to_i
    self.alerts_count = Alert.total_errors(0).count
    self.db_size = get_db_size
    self.sources_working_count = Source.working.count
    self.sources_waiting_count = Source.waiting.count
    self.sources_disabled_count = Source.disabled.count
    self.version = Lagotto::VERSION
    self.current_version = get_current_version unless current_version.present?
  end

  def sources
    { "working" => sources_working_count,
      "waiting" => sources_waiting_count,
      "disabled" => sources_disabled_count }
  end

  def get_current_version
    result = get_result(RELEASES_URL)
    result = result.is_a?(Array) ? result.first : {}
    result.fetch("tag_name", "v.#{version}")[2..-1]
  end

  # get combined data and index size for all tables
  def get_db_size
    sql = "SELECT SUM(DATA_LENGTH + INDEX_LENGTH) as size FROM information_schema.TABLES where TABLE_SCHEMA = '#{ENV['DB_NAME'].to_s}';"
    result = ActiveRecord::Base.connection.exec_query(sql)
    result.rows.first.reduce(:+)
  end

  def outdated_version?
    Gem::Version.new(current_version) > Gem::Version.new(version)
  end

  def services_ok?
    # web, mysql and memcached must be running if you can see services panel on status page
    if redis == "OK" && sidekiq == "OK" && postfix == "OK"
      true
    else
      false
    end
  end

  def redis
    redis_client = Redis.new
    redis_client.ping == "PONG" ? "OK" : "failed"
  rescue
    "failed"
  end

  def sidekiq
    sidekiq_client = Sidekiq::ProcessSet.new
    sidekiq_client.size > 0 ? "OK" : "failed"
  rescue
    "failed"
  end

  def postfix
    Timeout::timeout(3) do
      Net::SMTP.start(ENV["MAIL_ADDRESS"], ENV["MAIL_PORT"])
    end
    "OK"
  rescue
    "failed"
  end

  def timestamp
    updated_at.utc.iso8601
  end

  def create_uuid
    write_attribute(:uuid, SecureRandom.uuid)
  end
end
