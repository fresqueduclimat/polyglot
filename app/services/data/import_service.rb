class Data::ImportService
  CONFIG_DIR = Rails.root.join("resources", "document_templates")
  RUBY_FILE_DIR = Rails.root.join("app", "classes", "documents")

  def initialize(project_name:, page_width:, page_height:)
    @project_name = project_name
    @page_width = page_width
    @page_height = page_height
    @ruby_file_path = RUBY_FILE_DIR.join("#{project_name}.rb")
  end

  def call
    json_data = load_json_data
    grouped_data = group_elements_by_id(json_data)
    config_hash = build_config_hash(grouped_data)
    sorted_config = sort_config_hash(config_hash)
    formatted_config = format_config_hash(sorted_config)
    ruby_file_content = wrap_config_hash_in_module(formatted_config)
    save_ruby_file(ruby_file_content)
    apply_rubocop_to_file

    puts("👍 Config file generated successfully at #{@ruby_file_path}")
  rescue StandardError => e
    puts("Error: #{e.message}")
  end

  private

  def load_json_data
    file_path = CONFIG_DIR.join(@project_name, "#{@project_name}.json")
    raise("JSON file not found at #{file_path}") unless File.exist?(file_path)

    JSON.parse(File.read(file_path))
  end

  def group_elements_by_id(json_data)
    json_data.group_by { |element| element["id"] }
  end

  def build_config_hash(grouped_data)
    ::Data::BuildConfigHashService.new(grouped_data:, page_width: @page_width, page_height: @page_height).call
  end

  def sort_config_hash(config_hash)
    config_hash.sort_by { |page_number, _| page_number.to_i }.to_h
  end

  def format_config_hash(sorted_config)
    sorted_config.map do |page_number, elements|
      format_page_config(page_number, elements)
    end.join(",\n")
  end

  def format_page_config(page_number, elements)
    formatted_elements = elements.map do |id, attrs|
      formatted_attrs = attrs.map { |key, value| "#{key}: #{value.inspect}" }.join(",")
      "#{id}: { #{formatted_attrs}}"
    end.join(",\n")

    "#{page_number} => {\n#{formatted_elements}\n}"
  end

  def wrap_config_hash_in_module(formatted_config)
    <<~RUBY
      module Documents::#{@project_name.camelize}
        CONFIG = {
      #{formatted_config}
        }.freeze
      end
    RUBY
  end

  def save_ruby_file(content)
    File.write(@ruby_file_path, content)
  rescue Errno::EACCES => e
    raise("Unable to write file: #{e.message}")
  end

  def apply_rubocop_to_file
    system("rubocop -A #{@ruby_file_path}")
  rescue StandardError => e
    raise("Error running RuboCop: #{e.message}")
  end
end
