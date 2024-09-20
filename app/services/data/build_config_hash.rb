class Data::BuildConfigHash
  def initialize(grouped_data:, page_width:, page_height:)
    @grouped_data = grouped_data
    @page_width = page_width
    @page_height = page_height
  end

  def call
    config_hash = {}

    @grouped_data.each do |id, elements|
      rectangle = elements.find { |e| e["type"] == "RECTANGLE" }
      text = elements.find { |e| e["type"] == "TEXT" }

      next unless rectangle && text

      page_number = rectangle["pageNumber"].to_i

      config_hash[page_number] ||= {}
      config_hash[page_number][id.to_sym] = build_element_attributes(rectangle, text)
    end

    config_hash
  end

  private

  def build_element_attributes(rectangle, text)
    {
      page: rectangle["pageNumber"].to_i,
      x_pos: point_to_percent(rectangle["x"].to_f, @page_width),
      y_pos: 100 - point_to_percent(rectangle["y"].to_f, @page_height),
      width: point_to_percent(rectangle["width"].to_f, @page_width),
      height: point_to_percent(rectangle["height"].to_f, @page_height),
      size: text.dig("textProperties", "fontSize") || 8,
      color: extract_color(text),
      style: extract_text_style(text),
      rotate: text["rotation"].to_f,
      align: extract_alignment(text, "horizontal"),
      valign: extract_alignment(text, "vertical")
    }
  end

  def extract_color(text)
    text["color"]&.first&.delete("#") || "000000"
  end

  def extract_text_style(text)
    text.dig("textProperties", "isBold") ? :bold : :normal
  end

  def extract_alignment(text, direction)
    text.dig("textAlignment", direction)&.downcase&.to_sym || :left
  end

  def point_to_percent(value, size)
    (value.to_i * 100).fdiv(size)
  end
end
