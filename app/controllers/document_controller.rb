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
    @pdf_file_path = "pdf/#{selected_document[:config_name].underscore}_#{language}.pdf"

    # PDF GENERATION
    config_name = selected_document[:config_name]
    config_module = "Documents::#{config_name}::CONFIG".constantize
    data = @result.to_h.transform_keys(&:to_sym)
    template = Rails.root.join("resources", "document_templates", config_name.underscore,
                               "#{config_name.underscore}.pdf")
    Prawn::Document.generate(Rails.root.join("public", "pdf", "#{config_name.underscore}_#{language}.pdf"),
                             page_size: selected_document[:page_size],
                             skip_page_creation: true,
                             margin: [0, 0, 0, 0]) do |pdf|
      Pdf::FontSelecter.new(pdf:, language:).call
      Pdf::Generator.new(pdf:, config_module:, data:, template:, language:).call
    end
  end
end
