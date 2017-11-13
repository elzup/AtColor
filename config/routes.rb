Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # devise_for :users
  namespace :v1, defaults: { format: :json } do
    resources :register, only: [:create], controller: :sessions, as: :register
    resources :login, only: [:create], controller: :sessions, as: :login
    resources :users, only: [:index]
    resources :pixels, only: [:index]
    put :pixels, to: 'pixels#update'
  end
end
