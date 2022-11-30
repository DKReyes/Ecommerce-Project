class LaptopsController < ApplicationController
  require 'date'
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "Laptops", "index"

    @x = 0
    if @x == 0
      @laptops = Laptop.page(params[:page])
    elsif @x == 1
      @laptops = Laptop.where("created_at >= ? AND created_at <= Date.today-3", Date.today).page(params[:page])
    elsif @x == 2
      @laptops = Laptop.where("updated_at >= ? AND updated_at <= ?", Date.today, Date.today).page(params[:page])
    end
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

  def recent
    add_breadcrumb "New Laptops", "recent"
    today = DateTime.now
    max_day = DateTime.now - 3.day

    @laptops = Laptop.where("created_at BETWEEN ? AND ?", max_day, today).page(params[:page])
  end

  def update
    add_breadcrumb "Updated Laptops", "update"
    today = Date.today
    max_day = Date.today - 3.day

    @laptops = Laptop.where("updated_at BETWEEN ? AND ?", max_day, today).page(params[:page])
  end
end
