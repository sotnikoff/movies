Rails.application.routes.draw do
  root 'pages#index'
  get '/reservations', to: 'pages#reservations'

  namespace :api, format: false do
    resources :movies, only: %i[show index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
