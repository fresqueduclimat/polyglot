class Projects::Selecter
  def initialize(projects:, project_id:)
    @projects = projects
    @project_id = project_id
  end

  def call
    @projects.values.select { |item| item[:project_id] == @project_id.to_i }
  end
end
