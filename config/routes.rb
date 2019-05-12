Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users, only: [:new, :index, :create]
  resources :sessions, only: [:new, :destroy, :create]
  resources :rooms, except: [:update, :edit] do
    resources :memberships, only: [:index, :create]
  end

  resources :messages, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'
end
