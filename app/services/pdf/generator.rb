class Pdf::Generator
  def initialize(pdf:, config_array:, data:, template:)
    @pdf = pdf
    @config_array = config_array
    @data = data
    @template = template
    @bounds = [@pdf.bounds.width, @pdf.bounds.height]
  end

  def call
    @config_array.each_with_index do |page, index|
      @pdf.start_new_page(template: @template, template_page: index + 1)
      @pdf.font("Noto")
      page.each do |(key, config)|
        @pdf.rotate(config[:rotate] || 0, origin: pos_from_percent(config[:x_pos], config[:y_pos])) do
          @pdf.fill_color(config[:color] || "000000")
          @pdf.text_box(
            @data[key],
            at: pos_from_percent(config[:x_pos], config[:y_pos]),
            size: config[:size] || 8,
            style: config[:style] || :normal,
            width: config[:width] || nil,
            height: config[:height] || nil,
            overflow: config[:overflow] || :expand,
            align: config[:align] || :left,
            valign: config[:valign] || :top
          )
        end
        # draw_bounding_box(config) # For debugging
      end
    end
  end

  private

  def pos_from_percent(x_pos, y_pos)
    [(x_pos * @bounds[0]).fdiv(100), (y_pos * @bounds[1]).fdiv(100)]
  end

  def draw_bounding_box(config)
    x, y = pos_from_percent(config[:x_pos], config[:y_pos])
    @pdf.bounding_box([x, y], width: config[:width] || 100, height: config[:height] || 12) do
      @pdf.stroke_bounds
    end
  end
end
