Rails.application.routes.draw do
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
  resources :laptops, only: [:index, :show] do
    collection do
      get "search"
    end
  end
end
