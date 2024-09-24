class Documents::SelecterService
  def initialize(documents:, document_id:)
    @documents = documents
    @document_id = document_id
  end

  def call
    selected_document = @documents.values.select { |item| item[:document_id] == @document_id.to_i }
    selected_document.first
  end
end
