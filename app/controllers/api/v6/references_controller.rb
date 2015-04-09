class Api::V6::ReferencesController < Api::BaseController
  # include helper module for DOI resolution
  include Resolvable

  before_filter :authenticate_user_from_token!, :load_work

  swagger_controller :references, "References"

  swagger_api :index do
    summary "Returns list of references for a particular work"
    param :query, :work_id, :string, :required, "Work ID"
    param :query, :relation_type_id, :string, :optional, "Relation_type ID"
    param :query, :source_id, :string, :optional, "Source ID"
    param :query, :page, :integer, :optional, "Page number"
    param :query, :per_page, :integer, :optional, "Results per page (0-1000), defaults to 500"
    response :ok
    response :unprocessable_entity
    response :not_found
    response :internal_server_error
  end

  def index
    collection = Relation.includes(:work, :related_work).where("work_id = ?", @work.id)

    if params[:relation_type_id] && relation_type = RelationType.where(name: params[:relation_type_id]).first
      collection = collection.where(relation_type_id: relation_type.id)
    end

    if params[:source_id] && source = Source.where(name: params[:source_id]).first
      collection = collection.where(source_id: source.id)
    end

    per_page = params[:per_page] && (0..1000).include?(params[:per_page].to_i) ? params[:per_page].to_i : 1000

    collection = collection.paginate(per_page: per_page,
                                     page: params[:page])

    fresh_when last_modified: collection.maximum(:updated_at)

    @references = collection.decorate(context: { info: params[:info],
                                                    source_id: params[:source_id],
                                                    admin: current_user.try(:is_admin_or_staff?) })
  end

  protected

  def load_work
    # Load one work given query params
    id_hash = get_id_hash(params[:work_id])
    if id_hash.respond_to?("key")
      key, value = id_hash.first
      @work = Work.where(key => value).first
    else
      fail ActiveRecord::RecordNotFound
    end
  end
end
