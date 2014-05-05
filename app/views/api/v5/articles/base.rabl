collection @articles

attributes :doi, :title, :canonical_url, :mendeley_uuid, :pmid, :pmcid, :issued, :viewed, :saved, :discussed, :cited, :update_date

unless params[:info] == "summary"
  child :retrieval_statuses => :sources do
    attributes :name, :display_name, :group_name, :events_url, :metrics, :by_day, :by_month, :by_year, :update_date

    attributes :events if params[:info] == "detail"
  end
end
