Rails.application.routes.draw do
  devise_for :users
  root to: 'stocks#index'
  resources 'items'
  delete 'items', to: 'items#destroy_many'
  resources 'stocks', only: [:new, :create]
end
