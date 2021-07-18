Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/" => "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session

  post "users/login", to: "users#login"
  get "/owner" => "owner#new", as: :new_owner
  get "/customer" => "customer#new", as: :new_customer
  get "/order_history" => "order_history#new", as: :new_order_history
  get "/pending_orders" => "pending_orders#new", as: :new_pending_orders
  resources :users
  resources :menu_categories
  resources :menu_items
  resources :cart_items
  resources :orders
  resources :order_items
end
