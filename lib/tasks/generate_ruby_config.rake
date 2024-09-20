namespace :generate do
  desc "Generate Ruby config file from JSON, ordered by pageNumber"
  task generate_ruby_config: :environment do
    require "json"

    # page_width = 597
    # page_height = 408
    # project_name = "polyglot_fdc_adult_cards"

    # page_width = 396
    # page_height = 595
    # project_name = "facilitation_guide"

    page_width = 960
    page_height = 540
    project_name = "facilitation_kit"

    # Load the JSON file
    json_file_path = Rails.root.join("resources", "document_templates", project_name, "#{project_name}.json")
    json_data = JSON.parse(File.read(json_file_path))

    # Organize the data by id first, then merge the TEXT and RECTANGLE information
    grouped_data = json_data.group_by { |element| element["id"] }

    config_hash = {}

    grouped_data.each do |id, elements|
      rectangle = elements.find { |e| e["type"] == "RECTANGLE" }
      text = elements.find { |e| e["type"] == "TEXT" }

      next unless rectangle && text # Ensure both RECTANGLE and TEXT exist for the id

      page_number = rectangle["pageNumber"].to_i

      config_hash[page_number] ||= {}
      config_hash[page_number][id.to_sym] = {
        page: page_number,
        x_pos: point_to_percent(rectangle["x"].to_f, page_width),
        y_pos: 100 - point_to_percent(rectangle["y"].to_f, page_height),
        width: point_to_percent(rectangle["width"].to_f, page_width),
        height: point_to_percent(rectangle["height"].to_f, page_height),
        size: text.dig("textProperties", "fontSize") || 8,
        color: text["color"]&.first&.delete("#") || "000000",
        style: text.dig("textProperties", "isBold") ? :bold : :normal,
        rotate: text["rotation"].to_f,
        align: text.dig("textAlignment", "horizontal")&.downcase&.to_sym || :left,
        valign: text.dig("textAlignment", "vertical")&.downcase&.to_sym || :top
      }
    end

    # Sort the config_hash by pageNumber (keys)
    sorted_config = config_hash.sort_by { |page_number, _| page_number }.map do |_, elements|
      "{\n" + elements.map do |id, attrs|
        "  #{id}: { " +
          attrs.map { |key, value| "#{key}: #{value.inspect}" }.join(", ") +
          " }"
      end.join(",\n") + "\n}"
    end

    # Generate the Ruby file content
    ruby_file_content = <<~RUBY
      module #{project_name.camelize}
        CONFIG = [
          #{sorted_config.join(",\n")}
        ].freeze
      end
    RUBY

    # Save the content to the Ruby file
    ruby_file_path = Rails.root.join("app", "classes", "#{project_name}.rb")
    File.write(ruby_file_path, ruby_file_content)

    puts "👍 Config file generated successfully at #{ruby_file_path}"
  end

  def point_to_percent(value, size)
    (value.to_i * 100).fdiv(size)
  end
end
