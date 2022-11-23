class CartController < ApplicationController
  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i

    # Pushes ID to the end of the array.
    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      laptop = Laptop.find(id)
      flash[:notice] = " #{laptop.name} added to cart."
    end

    redirect_to root_path
  end

  def destroy

  end
end
