Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # devise_for :users, only: []
  namespace :v1, defaults: { format: :json } do
    resources :login, only: [:create], controller: :sessions
    resources :users, only: [:index]
    resources :pixels, only: [:index]
    put :pixels, to: 'pixels#update', as: :profile
  end
end
