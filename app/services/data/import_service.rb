class Data::ImportService
  def initialize(project_name:, page_width:, page_height:)
    @project_name = project_name
    @page_width = page_width
    @page_height = page_height
    @ruby_file_path = Rails.root.join("app", "classes", "documents", "#{@project_name}.rb")
  end

  def call
    grouped_data = group_elements_by_id(load_json_data)

    config_hash = ::Data::BuildConfigHashService.new(grouped_data:, page_width: @page_width,
                                                     page_height: @page_height).call

    sorted_config = sort_config_hash_by_page_number(config_hash)

    ruby_file_content = generate_ruby_file_content(sorted_config)

    save_ruby_file(ruby_file_content)

    apply_rubocop_to_file
  end

  private

  def load_json_data
    file_path = Rails.root.join("resources", "document_templates", @project_name, "#{@project_name}.json")
    JSON.parse(File.read(file_path))
  rescue Errno::ENOENT => e
    puts("Error: JSON file not found - #{e.message}")
    exit
  end

  def group_elements_by_id(json_data)
    json_data.group_by { |element| element["id"] }
  end

  def sort_config_hash_by_page_number(config_hash)
    config_hash.sort_by { |page_number, _| page_number }.map do |_, elements|
      format_elements(elements)
    end
  end

  def format_elements(elements)
    "{\n#{elements.map do |id, attrs|
            "  #{id}: { #{attrs.map { |key, value| "#{key}: #{value.inspect}" }.join(', ')} }"
          end.join(",\n")}\n}"
  end

  def generate_ruby_file_content(sorted_config)
    <<~RUBY
      module Documents::#{@project_name.camelize}
        CONFIG = [
          #{sorted_config.join(",\n")}
        ].freeze
      end
    RUBY
  end

  def save_ruby_file(content)
    File.write(@ruby_file_path, content)
  rescue Errno::EACCES => e
    puts("Error: Unable to write file - #{e.message}")
    exit
  end

  def apply_rubocop_to_file
    system("rubocop -A #{@ruby_file_path}")
    puts("👍 Config file generated successfully at #{@ruby_file_path}")
  rescue StandardError => e
    puts("Error running RuboCop: #{e.message}")
  end
end
