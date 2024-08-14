module Documents
  module Fdc
    ADULT_CARDS = {
      document_id: 7,
      name: "Adult Cards",
      api_key: ENV["FDC_ADULT_CARDS"]
    }.freeze

    KID_CARDS = {
      document_id: 8,
      name: "Kids Cards",
      api_key: ENV["FDC_KID_CARDS"]
    }.freeze
  end
end
