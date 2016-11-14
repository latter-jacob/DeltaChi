Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :contacts, only: [:new, :create, :destroy, :index]
  resources :carousel_items, only: [:new, :create, :destroy, :index]
  resources :founding_fathers, only: [:new, :create, :index]
  resources :execs

  get '/donate', to: 'homes#donate'


end
