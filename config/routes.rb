Rails.application.routes.draw do
  mount MissionControl::Jobs::Engine, at: "/jobs"

  root "document#show"
  resource :document, only: [:show], controller: "document"
  get "up" => "rails/health#show", as: :rails_health_check
end
