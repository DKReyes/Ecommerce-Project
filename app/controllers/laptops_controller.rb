class LaptopsController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "Laptops", "index"
    @laptops = Laptop.page(params[:page])
  end

  def show
    add_breadcrumb "Laptops", "index"
    @laptop = Laptop.includes(:category).find(params[:id])
    add_breadcrumb @laptop.category.name, "/categories/" + @laptop.category.id.to_s
    add_breadcrumb @laptop.name, "/laptops/" + @laptop.id.to_s
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    wildcard_search2 = "%#{params[:category]}%"

    @laptops = Laptop.where("name LIKE ? AND category_id LIKE ?", wildcard_search, wildcard_search2).page(params[:page])
  end

  def discounts
    add_breadcrumb "Laptops", "index"
    add_breadcrumb "Discounts", "discounts"

    @laptops = Laptop.where("price != discount").page(params[:page])
  end
end
