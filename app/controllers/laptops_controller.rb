class LaptopsController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "Laptops", index_path
    @laptops = Laptop.page(params[:page])
  end

  def show
    add_breadcrumb "Laptops", index_path
    add_breadcrumb "index",
    @laptop = Laptop.includes(:category).find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    wildcard_search2 = "%#{params[:category]}%"

    @laptops = Laptop.where("name LIKE ? AND category_id LIKE ?", wildcard_search, wildcard_search2).page(params[:page])
  end
end
