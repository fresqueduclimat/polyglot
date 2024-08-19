Rails.application.routes.draw do
  root "document#show"
  resource :document, only: [:show], controller: "document"
  resource :pdf, only: [:show], controller: "pdf"
  get "up" => "rails/health#show", as: :rails_health_check
end
