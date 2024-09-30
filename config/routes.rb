Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "document#show"
  resource :document, only: [:show], controller: "document"
  get "up" => "rails/health#show", as: :rails_health_check
end
