Rails.application.routes.draw do
  root 'pages#index'
  get '/reservations', to: 'pages#reservations'

  namespace :api, format: false do
  	resources :shows, only: %i[show]
    resources :movies, only: %i[show index]
    post 'create_order', to: 'orders#create_order', as: 'create_order'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
