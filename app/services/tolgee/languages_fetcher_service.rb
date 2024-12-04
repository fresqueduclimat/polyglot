class Tolgee::LanguagesFetcherService < Tolgee::BaseFetcherService
  def initialize(document_id:, api_key:)
    super(base_url: ::Tolgee::Base::BASE_URL, api_key:)
    @document_id = document_id
  end

  def call
    fetch(endpoint: "#{@document_id}/languages", params: {size: 100, format: "JSON", zip: "false"})
  end
end
