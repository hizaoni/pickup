Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources 'items'
  delete 'items', to: 'items#destroy_many'
end
