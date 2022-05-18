Rails.application.routes.draw do
  devise_for :users
  root to: 'stocks#index'
  resources 'items'
  delete 'items', to: 'items#destroy_many'
  resources 'stocks', only: [:new, :create]
  post 'stocks/choice', to: 'stocks#category_choice', as: "category_choice"
  resources 'ships', only: [:new, :create, :index]
end
