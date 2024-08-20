module Documents
  module Fdc
    ADULT_CARDS = {
      config_name: "FdcAdultCards",
      document_id: 7,
      name: "Adult Cards",
      page_size: [448, 306],
      api_key: ENV["FDC_ADULT_CARDS"]
    }.freeze

    POLYGLOT_FDC_ADULT_CARDS = {
      config_name: "PolyglotFdcAdultCards",
      document_id: 20,
      name: "Polyglot adult cards",
      page_size: [448, 306],
      api_key: ENV["POLYGLOT_FDC_ADULT_CARDS"]
    }.freeze

    KID_CARDS = {
      config_name: "FdcKidCards",
      document_id: 8,
      name: "Kids Cards",
      page_size: [448, 306],
      api_key: ENV["FDC_KID_CARDS"]
    }.freeze
  end
end
