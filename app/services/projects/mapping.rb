class Projects::Mapping
  def initialize(projects:)
    @projects = projects
  end

  def call
    @projects.map do |key, value|
      [value[:name], value[:project_id]]
    end
  end
end
