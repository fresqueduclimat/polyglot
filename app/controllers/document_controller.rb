class DocumentController < ApplicationController
  def show
    documents = ::Documents::FetcherService.new.call
    document_id = params[:document_id] || documents.first.last[:document_id]
    selected_document = ::Documents::SelecterService.new(documents:, document_id:).call
    api_key = selected_document[:api_key]

    parsed_languages = ::Tolgee::LanguagesFetcherService.new(document_id:, api_key:).call
    @languages = parsed_languages.dig("_embedded", "languages").map { |language| language["tag"] }
    language = ::Languages::SelecterService.new(languages: @languages, language_param: params[:language]).call

    @documents = ::Documents::MappingService.new(documents:).call
    @result = ::Tolgee::ContentFetcherService.new(document_id:, language:, api_key:).call
    @pdf_file_path = "pdf/#{selected_document[:config_name].underscore}_#{language}.pdf"

    # PDF GENERATION
    config_name = selected_document[:config_name]
    config_module = "::Documents::#{config_name}::CONFIG".constantize
    data = @result.to_h.transform_keys(&:to_sym)
    template_path = Rails.root.join("resources", "templates", config_name.underscore, "#{config_name.underscore}.pdf")
    Prawn::Document.generate(Rails.root.join("public", "pdf", "#{config_name.underscore}_#{language}.pdf"),
                             page_size: selected_document[:page_size],
                             skip_page_creation: true,
                             margin: [0, 0, 0, 0]) do |pdf|
      ::Pdf::FontSelecterService.new(pdf:, language:).call
      ::Pdf::GeneratorService.new(pdf:, config_module:, data:, template_path:, language:).call
    end
  end
end
