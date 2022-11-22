class HomeController < ApplicationController
  def index
    @laptops = Laptop.page(params[:page])
  end
end