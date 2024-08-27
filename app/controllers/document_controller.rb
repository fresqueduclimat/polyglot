class DocumentController < ApplicationController
  def show
    document_id = params[:document_id] || 20
    documents = Documents::Fetcher.new.call
    selected_document = Documents::Selecter.new(documents:, document_id:).call
    api_key = selected_document[:api_key]

    parsed_languages = Tolgee::LanguagesFetcher.new(document_id:, api_key:).call
    @languages = parsed_languages.dig("_embedded", "languages").map { |language| language["tag"] }
    language = Languages::Selecter.new(languages: @languages, language_param: params[:language]).call

    @documents = Documents::Mapping.new(documents:).call
    @result = Tolgee::ContentFetcher.new(document_id:, language:, api_key:).call
    @img_files = Dir.glob(File.join("public/#{selected_document[:config_name].underscore}", "*.png"))
    @document_size = selected_document[:page_size]

    return if document_id == 8.to_s

    # PDF GENERATION
    config_name = selected_document[:config_name]
    config_array = config_name.constantize::CONFIG
    @config_array = config_array
    data = @result.to_h.transform_keys(&:to_sym)
    template = Rails.root.join("resources", "document_templates", config_name.underscore,
                               "#{config_name.underscore}.pdf")
    Prawn::Document.generate(Rails.root.join("public", "pdf", "#{config_name.underscore}_#{language}.pdf"),
                             page_size: @document_size,
                             skip_page_creation: true,
                             margin: [0, 0, 0, 0]) do |pdf|
      Pdf::FontSelecter.new(pdf:, language:).call
      Pdf::Generator.new(pdf:, config_array:, data:, template:).call
    end
  end
end
