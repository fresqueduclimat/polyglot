class Languages::SelecterService
  def initialize(languages:, language_param:)
    @languages = languages
    @language_param = language_param
  end

  def call
    if @language_param.present? && @language_param.in?(@languages)
      @language_param
    else
      @languages.first
    end
  end
end
