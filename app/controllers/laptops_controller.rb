class LaptopsController < ApplicationController
  require 'date'
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "Laptops", "index"

    @laptops = Laptop.page(params[:page])
    @order_detail = current_order.order_details.new
  end

  def show
    add_breadcrumb "Laptops", "index"
    @laptop = Laptop.includes(:category).find(params[:id])
    add_breadcrumb @laptop.category.name, "/categories/" + @laptop.category.id.to_s
    add_breadcrumb @laptop.name, "/laptops/" + @laptop.id.to_s
    @order_detail = current_order.order_details.new
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    wildcard_search2 = "%#{params[:category]}%"

    @laptops = Laptop.where("name LIKE ? AND category_id LIKE ?", wildcard_search, wildcard_search2).page(params[:page])
    @order_detail = current_order.order_details.new
  end

  def discounts
    add_breadcrumb "Laptops", "index"
    add_breadcrumb "Discounts", "discounts"

    @laptops = Laptop.where("price != discount").page(params[:page])
    @order_detail = current_order.order_details.new
  end

  def recent
    add_breadcrumb "New Laptops", "recent"
    today = DateTime.now
    max_day = DateTime.now - 3.day

    @laptops = Laptop.where("created_at BETWEEN ? AND ?", max_day, today).page(params[:page])
    @order_detail = current_order.order_details.new
  end

  def update
    add_breadcrumb "Updated Laptops", "update"
    today = Date.today
    max_day = Date.today - 3.day

    @laptops = Laptop.where("updated_at BETWEEN ? AND ?", max_day, today).page(params[:page])
    @order_detail = current_order.order_details.new
  end
end
