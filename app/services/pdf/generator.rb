class Pdf::Generator
  def initialize(pdf:, config_module:, data:, template:, language:)
    @pdf = pdf
    @config_module = config_module
    @data = data
    @template = template
    @bounds = [@pdf.bounds.width, @pdf.bounds.height]
    @language = language
  end

  def call
    @config_module.each do |page_number, configs|
      @pdf.start_new_page(template: @template, template_page: page_number)
      # Pdf::DrawGrid.new(pdf: @pdf, bounds: @bounds).call # For debugging
      @pdf.font("Font")
      configs.each do |(key, config)|
        next unless @data[key]

        set_leading(size: config[:size])
        @pdf.rotate(config[:rotate] || 0, origin: pos_percent_to_points(config[:x_pos], config[:y_pos])) do
          @pdf.fill_color(config[:color] || "000000")
          insert_text(config, key)
          # draw_bounding_box(config) # For debugging
        end
      end
      insert_images(page_number:)
    end
  end

  private

  def set_leading(size:)
    leading = Documents::Languages::CONFIG[@language][:leading] || 0.4
    @pdf.default_leading = leading * size
  end

  def insert_text(config, key)
    @pdf.text_box(
      @data[key],
      at: pos_percent_to_points(config[:x_pos], config[:y_pos]),
      size: config[:size],
      style: config[:style] || :normal,
      width: size_percent_to_points(config[:width], 0),
      height: size_percent_to_points(config[:height], 1),
      overflow: :shrink_to_fit,
      align: alignment(config),
      valign: config[:valign] || :top
    )
  end

  def insert_images(page_number:)
    Documents::PolyglotFdcAdultCardsImages::CONFIG[page_number]&.each_value do |config|
      image_config = config[@language]
      next unless image_config

      @pdf.image(image_config[:url], at: [pos_percent_to_points(image_config[:x_pos], image_config[:y_pos])],
                                     scale: image_config[:scale])
    end
  end

  def pos_percent_to_points(x_value, y_value)
    [(x_value * @bounds[0]).fdiv(100), (y_value * @bounds[1]).fdiv(100)]
  end

  def size_percent_to_points(value, axis)
    return nil if value.nil?

    (value * @bounds[axis]).fdiv(100)
  end

  def draw_bounding_box(config)
    x, y = pos_percent_to_points(config[:x_pos], config[:y_pos])
    @pdf.bounding_box([x, y], width: size_percent_to_points(config[:width], 0),
                              height: size_percent_to_points(config[:height], 1)) do
      @pdf.stroke_bounds
    end
  end

  def alignment(config)
    case config[:align]
    when :center then :center
    when :right then :right
    else
      Documents::Languages::CONFIG[@language][:rtl] ? :right : :left
    end
  end
end
