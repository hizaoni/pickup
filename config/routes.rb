Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
  root to: 'stocks#index'
  resources 'items'
  delete 'items', to: 'items#destroy_many'
  post 'items/select', to: 'items#category_select'
  post 'items/quantity', to: 'items#item_quantity'
  resources 'stocks', only: [:new, :create]
  resources 'ships', only: [:new, :create, :index]
end
