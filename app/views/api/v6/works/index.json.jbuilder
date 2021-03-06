json.meta do
  json.status "ok"
  json.set! :"message-type", "work-list"
  json.set! :"message-version", "6.0.0"
  json.total @works.total_entries
  json.total_pages @works.per_page > 0 ? @works.total_pages : 1
  json.page @works.total_entries > 0 ? @works.current_page : 1
end

json.works @works do |work|
  json.cache! ['v6', work], skip_digest: true do
    json.(work, :id, :publisher_id, :author, :title, :issued)
    json.set! :"container-title", work.container_title
    json.(work, :volume, :page, :issue, :DOI, :URL, :PMID, :PMCID, :arxiv, :scp, :wos, :ark, :events, :timestamp)
  end
end
