class HomeController < ApplicationController
  def index
    @laptop = Laptop.find(Laptop.pluck(:id).sample)
    @laptops = Laptop.page(params[:page])
    @categories = Category.all
  end
end