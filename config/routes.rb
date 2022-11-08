Rails.application.routes.draw do
  get 'order_details/index'
  get 'order_details/show'
  get 'customers/index'
  get 'customers/show'
  get 'laptops/index'
  get 'laptops/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
