Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resource :pdf, only: [:show], controller: "pdf"
  root "pdf#show"
end
