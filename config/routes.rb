Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :contacts, only: [:new, :create, :destroy, :index]
  resources :carousel_items, only: [:new, :create, :destroy, :index]


end
