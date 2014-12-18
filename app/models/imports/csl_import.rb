class CslImport < Import

  def initialize(options = {})
    @file = options.fetch(:file, nil)
    member = options.fetch(:member, nil)
    @member_list = member.to_s.split(",")
  end

  def total_results
    @file.length
  end

  def get_data(offset = 0)
    @file
  end

  def parse_data(result)
    Array(result).map do |item|
      doi = item.fetch("DOI", nil)
      canonical_url = item.fetch("URL", nil)

      date_parts = item["issued"]["date-parts"][0]
      year, month, day = date_parts[0], date_parts[1], date_parts[2]

      title = item.fetch("title", nil)
      member_id = @member_list.first
      if member_id
        publisher = Publisher.where(member_id: member_id).first
      else
        publisher = item.fetch("publisher", nil)
      end

      type = item.fetch("type", nil)
      work_type_id = WorkType.where(name: type).pluck(:id).first

      csl = {
        "issued" => item.fetch("issued", []),
        "author" => item.fetch("author", []),
        "container-title" => item.fetch("container-title", [])[0],
        "page" => item.fetch("page", nil),
        "issue" => item.fetch("issue", nil),
        "title" => title,
        "type" => type,
        "DOI" => doi,
        "URL" => canonical_url,
        "publisher" => publisher,
        "volume" => item.fetch("volume", nil)
      }

      { doi: doi,
        title: title,
        year: year.to_i,
        month: month.to_i,
        day: day.to_i,
        publisher_id: member_id,
        work_type_id: work_type_id,
        csl: csl }
    end
  end
end