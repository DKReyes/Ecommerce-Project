class LaptopsController < ApplicationController
  def index
    @laptops = Laptop.page(params[:page])
  end

  def show
  end
end
