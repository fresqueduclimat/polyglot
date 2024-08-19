class Pdf::FontSelecter
  def initialize(pdf:, language:)
    @pdf = pdf
    @language = language
  end

  def call
    case @language
    when "ja-JP"
      @pdf.font_families.update("Noto" => {
                    normal: Rails.root.join("app/assets/fonts/NotoSansJP/NotoSansJP-Regular.ttf"),
                    bold: Rails.root.join("app/assets/fonts/NotoSansJP/NotoSansJP-Bold.ttf"),
                    medium: Rails.root.join("app/assets/fonts/NotoSansJP/NotoSansJP-Medium.ttf")
                  })
    when "ar-AR"
      @pdf.font_families.update("Noto" => {
            normal: Rails.root.join("app/assets/fonts/NotoSansArabic/NotoSansArabic-Regular.ttf"),
            bold: Rails.root.join("app/assets/fonts/NotoSansArabic/NotoSansArabic-Bold.ttf"),
            medium: Rails.root.join("app/assets/fonts/NotoSansArabic/NotoSansArabic-Medium.ttf")
          })
    else
      @pdf.font_families.update("Noto" => {
            normal: Rails.root.join("app/assets/fonts/NotoSans/NotoSans-Regular.ttf"),
            bold: Rails.root.join("app/assets/fonts/NotoSans/NotoSans-Bold.ttf"),
            medium: Rails.root.join("app/assets/fonts/NotoSans/NotoSans-Medium.ttf")
          })
    end
  end
end
