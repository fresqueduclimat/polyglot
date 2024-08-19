Rails.application.routes.draw do
  root "document#show"
  resource :document, only: [:show], controller: "document"
  get "up" => "rails/health#show", as: :rails_health_check
end
