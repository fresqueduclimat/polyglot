class DocumentController < ApplicationController
  def show
    document_id = params[:document_id] || 7
    documents = Documents::Fetcher.new.call
    selected_document = Documents::Selecter.new(documents:, document_id:).call
    config_name = selected_document.first[:config_name]

    api_key = selected_document.first[:api_key]
    parsed_languages = Tolgee::LanguagesFetcher.new(document_id:, api_key:).call
    @languages = parsed_languages["_embedded"]["languages"].map { |language| language["tag"] }
    # language = Languages::Selecter.new(languages: @languages, language_param: params[:laguage]).call
    language = if params[:language].present? && params[:language].in?(@languages)
                 params[:language]
               else
                 @languages.first
               end

    @documents = Documents::Mapping.new(documents:).call
    @result = Tolgee::ContentFetcher.new(document_id:, language:, api_key:).call

    return if document_id == 8.to_s

    # PDF GENERATION
    config_array = config_name.constantize::CONFIG
    data = @result.to_h.transform_keys(&:to_sym)
    page_size = [448, 306]
    puts config_name.underscore
    template = Rails.root.join("resources", "document_templates", "#{config_name.underscore}.pdf")
    Prawn::Document.generate(Rails.root.join("public", "pdf", "#{config_name.underscore}.pdf"), page_size:,
                                                                                                skip_page_creation: true) do |pdf|
      Pdf::FontSelecter.new(pdf:, language:).call
      Pdf::Generator.new(pdf:, config_array:, data:, template:).call
    end
  end
end
