class Tolgee::ContentFetcher < Tolgee::BaseFetcher
  def initialize(project_id:, language:, api_key:)
    super(base_url: Documents::Base::TOLGEE_BASE_URL, api_key: api_key)
    @project_id = project_id
    @language = language
  end

  def call
    fetch(endpoint: "#{@project_id}/export", params: { languages: @language, format: "JSON", zip: "false" })
  end
end
