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
      # draw_grid # For debugging
      @pdf.font("Noto")
      page.each do |(key, config)|
        if key.to_s.include?("img")
          @pdf.image(config[:url], at: pos_percent_to_points(config[:x_pos], config[:y_pos]),
                                   scale: config[:scale] || 1)
        else
          @pdf.rotate(config[:rotate] || 0, origin: pos_percent_to_points(config[:x_pos], config[:y_pos])) do
            @pdf.fill_color(config[:color] || "000000")
            draw_text_box(config, key)
            # draw_bounding_box(config) # For debugging
          end
        end
      end
    end
  end

  private

  def draw_text_box(config, key)
    @pdf.text_box(
      @data[key],
      at: pos_percent_to_points(config[:x_pos], config[:y_pos]),
      size: config[:size] || 60,
      style: config[:style] || :normal,
      width: size_percent_to_points(config[:width], 0),
      height: size_percent_to_points(config[:height], 1),
      overflow: config[:overflow] || :shrink_to_fit,
      align: config[:align] || :left,
      valign: config[:valign] || :top
    )
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
    @pdf.bounding_box([x, y], width: size_percent_to_points(config[:width], 0) || 100,
                              height: size_percent_to_points(config[:height], 1) || 12) do
      @pdf.stroke_bounds
    end
  end

  def draw_grid
    step_percentage = 10
    width, height = @bounds
    # Draw vertical lines
    (0..100).step(step_percentage).each do |percent|
      x = (percent * width).fdiv(100)
      @pdf.stroke_color("E8E8E8")
      @pdf.stroke_line([x, 0], [x, height])
    end
    # Draw horizontal lines
    (0..100).step(step_percentage).each do |percent|
      y = (percent * height).fdiv(100)
      @pdf.stroke_color("E8E8E8")
      @pdf.stroke_line([0, y], [width, y])
    end
  end
end
