class HomeController < ApplicationController
  def index
    @laptops = Laptop.page(params[:page])
    @categories = Category.all
  end
end