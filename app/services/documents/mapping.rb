class Documents::Mapping
  def initialize(documents:)
    @documents = documents
  end

  def call
    @documents.map do |_key, value|
      [value[:name], value[:document_id]]
    end
  end
end
