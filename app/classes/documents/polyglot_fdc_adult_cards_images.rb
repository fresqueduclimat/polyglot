module Documents::PolyglotFdcAdultCardsImages
  BASE_PATH = "public/images/polyglot_fdc_adult_cards".freeze
  CONFIG = {
    1 => {
      IMG01: {
        "fr-FR" => {url: "#{BASE_PATH}/logo-fr.png", x_pos: 25, y_pos: 60, scale: 0.25},
        "ar-AR" => {url: "#{BASE_PATH}/logo-ar.png", x_pos: 25, y_pos: 60, scale: 0.3}
      },
      IMG02: {
        "ar-AR" => {url: "#{BASE_PATH}/logo-fr.png", x_pos: 60, y_pos: 80, scale: 0.1}
      }
    }
  }.freeze
end
