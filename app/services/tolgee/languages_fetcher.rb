class Tolgee::LanguagesFetcher < Tolgee::BaseFetcher
  def initialize(document_id:, api_key:)
    super(base_url: Tolgee::Base::BASE_URL, api_key:)
    @document_id = document_id
  end

  def call
    fetch(endpoint: "#{@document_id}/languages", params: {format: "JSON", zip: "false"})
  end
end
