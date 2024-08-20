class Tolgee::BaseFetcher
  def initialize(base_url:, api_key:)
    @base_url = base_url
    @api_key = api_key
  end

  def fetch(endpoint:, params:)
    url = "#{@base_url}/#{endpoint}"
    response = Faraday.get(url, params) do |req|
      req.headers["X-API-Key"] = @api_key
    end

    handle_response(response)
  end

  private

  def handle_response(response)
    raise FetchError, "Failed to fetch data: #{response.body}" unless response.success?

    JSON.parse(response.body)
  end

  class FetchError < StandardError; end
end
