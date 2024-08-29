class Pdf::FontSelecter
  def initialize(pdf:, language:)
    @pdf = pdf
    @language = language
  end

  def call
    font = Documents::Languages::CONFIG[@language][:font]
    font_paths = font_paths_for(font)

    @pdf.font_families.update("Font" => {
                                normal: Rails.root.join(font_paths[:normal]),
                                bold: Rails.root.join(font_paths[:bold]),
                                medium: Rails.root.join(font_paths[:medium])
                              })
  end

  private

  def font_paths_for(font)
    base_paths = {
      "NotoSansJP" => "app/assets/fonts/NotoSansJP/NotoSansJP",
      "NotoSansArabic" => "app/assets/fonts/NotoSansArabic/NotoSansArabic",
      "NotoSans" => "app/assets/fonts/NotoSans/NotoSans",
      "Vazirmatn" => "app/assets/fonts/Vazirmatn/Vazirmatn",
      "default" => "app/assets/fonts/Urbanist/Urbanist"
    }

    base_path = base_paths.fetch(font, base_paths["default"])

    {
      normal: "#{base_path}-Regular.ttf",
      bold: "#{base_path}-Bold.ttf",
      medium: "#{base_path}-Medium.ttf"
    }
  end
end
