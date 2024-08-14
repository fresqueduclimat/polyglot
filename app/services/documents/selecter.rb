class Documents::Selecter
  def initialize(documents:, document_id:)
    @documents = documents
    @document_id = document_id
  end

  def call
    @documents.values.select { |item| item[:document_id] == @document_id.to_i }
  end
end
