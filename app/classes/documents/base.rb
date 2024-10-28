module Documents::Base
  FDC_ADULT_CARDS = {
    config_name: "FdcAdultCards",
    document_id: 7,
    name: "Adult cards",
    page_size: [597, 408],
    api_key: ENV["TOLGEE_FDC_ADULT_CARDS"]
  }.freeze

  FACILITATION_GUIDE = {
    config_name: "FacilitationGuide",
    document_id: 22,
    name: "Facilitation Guide",
    page_size: [396, 595],
    api_key: ENV["TOLGEE_FACILITATION_GUIDE"]
  }.freeze

  FACILITATION_KIT = {
    config_name: "FacilitationKit",
    document_id: 24,
    name: "Facilitation Kit",
    page_size: [960, 540],
    api_key: ENV["TOLGEE_FACILITATION_KIT"]
  }.freeze
end
