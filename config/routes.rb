Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/" => "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

  post "users/login", to: "users#login"
  get "/owner" => "owner#new", as: :new_owner
  resources :users
  resources :menu_categories
  resources :menu_items
  resources :customer
end
