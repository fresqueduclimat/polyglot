module Documents
  module Fdc
    ADULT_CARDS = {
      project_id: 7,
      name: "Adult Cards",
      api_key: ENV["FDC_ADULT_CARDS"]
    }.freeze

    KID_CARDS = {
      project_id: 8,
      name: "Kids Cards",
      api_key: ENV["FDC_KID_CARDS"]
    }.freeze
  end
end
