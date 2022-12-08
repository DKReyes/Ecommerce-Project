Rails.application.routes.draw do
  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'categories/index'
  get 'categories/show'
  get 'orders/index'
  get 'orders/show'
  get 'order_details/index'
  get 'order_details/show'
  get 'customers/index'
  get 'customers/show'
  get 'laptops/index'
  get 'laptops/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get "/about", to: "about#index"

  get "laptops/index"
  get "laptops/discounts"
  get "laptops/recent"
  get "laptops/update"
  resources :laptops, only: [:index, :show] do
    collection do
      get "search"
    end
  end

  resources :cart, only: %i[create destroy]
  get "cart/index"
  get "cart/show"

  resources :order_details

  get "orders/index"
  get "orders/show"
  get "orders/admin"
  resources :orders

  # /checkout/success
  # /checkout/create
  # /checkout/cancel

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "sucess", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  get "categories/index"
  get "categories/:id", to: "categories#show", as: "category"
end
