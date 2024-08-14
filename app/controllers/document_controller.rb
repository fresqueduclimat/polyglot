class DocumentController < ApplicationController
  def show
    document_id = params[:document_id] || 7
    documents = Documents::Fetcher.new.call
    selected_document = Documents::Selecter.new(documents:, document_id:).call

    api_key = selected_document.first[:api_key]
    parsed_languages = Tolgee::LanguagesFetcher.new(document_id:, api_key:).call
    @languages = parsed_languages["_embedded"]["languages"].map { |language| language["tag"] }
    language = if params[:language].present? && params[:language].in?(@languages)
      params[:language]
    else
      @languages.first
    end

    @documents = Documents::Mapping.new(documents:).call
    @result = Tolgee::ContentFetcher.new(document_id:, language:, api_key:).call
  end
end
