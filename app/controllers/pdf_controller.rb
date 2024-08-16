class PdfController < ApplicationController
  def show
    config_array = FdcAdultCardsFrConfig::CONFIG
    data = FdcAdultCardsFr::CONTENT.to_h
    page_size = [448, 306]
    template = Rails.root.join("resources", "document_templates", "fdc_adult_cards.pdf")
    Prawn::Document.generate(Rails.root.join("public", "pdf", "fdc_adult_cards.pdf"), page_size:, skip_page_creation: true) do |pdf|
      bounds = [pdf.bounds.width, pdf.bounds.height]
      config_array.each_with_index do |page, index|
        pdf.start_new_page(template:, template_page: index + 1)
        page.each do |(key, config)|
          pdf.rotate(config[:rotate] || 0, origin: pos_from_percent(config[:x_pos], config[:y_pos], bounds)) do
            pdf.fill_color(config[:color] || "000000")
            pdf.text_box(
              data[key],
              at: pos_from_percent(config[:x_pos], config[:y_pos], bounds),
              size: config[:size] || 10,
              style: config[:style] || :normal,
              width: config[:width] || nil,
              height: config[:height] || nil,
              overflow: config[:overflow] || :expand,
              align: config[:align] || :left
            )
          end
        end
      end
    end
  end

  private

  def pos_from_percent(x_pos, y_pos, bounds)
    [(x_pos * bounds[0]).fdiv(100), (y_pos * bounds[1]).fdiv(100)]
  end
end
