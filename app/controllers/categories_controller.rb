class CategoriesController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "Category", "index"
    @categories = Category.page(params[:page])
  end

  def show
    add_breadcrumb "Category", "index"
    @category = Category.find(params[:id])
    @laptops = @category.laptop.page(params[:page])
    add_breadcrumb @category.name, @category.id.to_s
    # @laptops = Laptop.includes(:category).find(params[:category_id])
  end
end
