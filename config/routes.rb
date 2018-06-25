Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    resources :movies, only: %i[show index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
