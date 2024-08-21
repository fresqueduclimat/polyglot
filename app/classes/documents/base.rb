module Documents::Base
  POLYGLOT_FDC_ADULT_CARDS = {
    config_name: "PolyglotFdcAdultCards",
    document_id: 20,
    name: "Polyglot adult cards",
    page_size: [597, 408],
    api_key: ENV["POLYGLOT_FDC_ADULT_CARDS"]
  }.freeze

  FACILITATION_GUIDE = {
    config_name: "FacilitationGuide",
    document_id: 22,
    name: "Facilitation Guide",
    page_size: [396, 595],
    api_key: ENV["FACILITATION_GUIDE"]
  }.freeze
end
