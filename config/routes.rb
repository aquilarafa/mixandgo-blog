Rails.application.routes.draw do
  resources :posts, only: %i[index show new create edit update]
  resources :logins, only: %i[new create]
  delete "logout", to: "logins#destroy"
  resources :registrations, only: %i[new create]
end
