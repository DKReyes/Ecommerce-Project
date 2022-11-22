class LaptopsController < ApplicationController
  def index
    @laptops = Laptop.page(params[:page])
  end

  def show
    @laptop = Laptop.includes(:category).find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    wildcard_search2 = "%#{params[:category]}%"

    @laptops = Laptop.where("name LIKE ? AND category_id LIKE ?", wildcard_search, wildcard_search2).page(params[:page])
  end
end
