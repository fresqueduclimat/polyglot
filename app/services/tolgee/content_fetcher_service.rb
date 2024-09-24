class Tolgee::ContentFetcherService < Tolgee::BaseFetcherService
  def initialize(document_id:, language:, api_key:)
    super(base_url: ::Tolgee::Base::BASE_URL, api_key:)
    @document_id = document_id
    @language = language
  end

  def call
    fetch(endpoint: "#{@document_id}/export", params: {languages: @language, format: "JSON", zip: "false"})
  end
end
