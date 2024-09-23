# PAGE_WIDTH = 597
# PAGE_HEIGHT = 408
# PROJECT_NAME = "polyglot_fdc_adult_cards".freeze

# PAGE_WIDTH = 396
# PAGE_HEIGHT = 595
# PROJECT_NAME = "facilitation_guide".freeze

PAGE_WIDTH = 960
PAGE_HEIGHT = 540
PROJECT_NAME = "facilitation_kit".freeze

namespace :generate do
  task generate_ruby_config: :environment do
    ::Data::ImportService.new(
      project_name: PROJECT_NAME,
      page_width: PAGE_WIDTH,
      page_height: PAGE_HEIGHT
    ).call
  end
end
