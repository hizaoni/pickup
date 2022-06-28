Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    namespace :v1 do # バージョン1を表している
      resources :items_api
      resources :stocks_api
      resources :ships_api
    end
  end
  devise_for :users
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
  end
  
  root to: 'stocks#index'
  resources 'items'
  resources 'stocks', only: [:new, :create, :show, :destroy]
  resources 'ships', only: [:new, :create, :index, :show, :destroy]

  delete 'items', to: 'items#destroy_many'
  post 'items/select', to: 'items#category_select'
  post 'items/quantity', to: 'items#item_quantity'
  post 'items/search', to: 'items#search_item'
  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
 
end
