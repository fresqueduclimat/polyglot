class DocumentController < ApplicationController
  def show
    project_id = params[:project_id] || 7
    projects = Projects::Fetcher.new.call
    selected_project = Projects::Selecter.new(projects:, project_id:).call

    api_key = selected_project.first[:api_key]
    parsed_languages = Tolgee::LanguagesFetcher.new(project_id:, api_key:).call
    @languages = parsed_languages["_embedded"]["languages"].map { |language| language["tag"] }
    language = if params[:language].present? && params[:language].in?(@languages)
      params[:language]
    else
      @languages.first
    end

    @projects = Projects::Mapping.new(projects:).call
    @result = Tolgee::ContentFetcher.new(project_id:, language:, api_key:).call
  end
end
