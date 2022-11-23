class CartController < ApplicationController
  def create
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i

    # Pushes ID to the end of the array.
    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      laptop = Laptop.find(id)
      flash[:notice] = " [ #{laptop.name} ] added to cart."
    end

    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    laptop = Laptop.find(id)

    redirect_to root_path
    flash[:notice] = " [ #{laptop.name} ] Removed from cart."
  end
end
