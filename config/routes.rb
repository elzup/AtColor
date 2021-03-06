Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # devise_for :users
  namespace :v1, defaults: { format: :json } do
    resources :register, only: [:create], controller: :sessions, as: :register
    post :login, to: 'sessions#login'
    get :is_auth, to: 'sessions#is_auth'

    resources :users, only: [:index, :show]
    put :users, to: 'users#update'

    resources :pixels, only: [:index]
    put :pixels, to: 'pixels#update'

    resources :q, controller: :questions, as: :q
  end
end
