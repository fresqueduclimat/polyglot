class Tolgee::LanguagesFetcher < Tolgee::BaseFetcher
  def initialize(project_id:, api_key:)
    super(base_url: Documents::Base::TOLGEE_BASE_URL, api_key: api_key)
    @project_id = project_id
  end

  def call
    fetch(endpoint: "#{@project_id}/languages", params: { format: "JSON", zip: "false" })
  end
end
