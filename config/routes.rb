Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :contacts, only: [:new, :create, :destroy, :index]

end
