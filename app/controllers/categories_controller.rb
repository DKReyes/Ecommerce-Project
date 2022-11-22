class CategoriesController < ApplicationController
  def index
    @categories = Category.page(params[:page])
  end

  def show
    @category = Category.find(params[:id])
    @laptops = @category.laptop.page(params[:page])
    # @laptops = Laptop.includes(:category).find(params[:category_id])
  end
end
