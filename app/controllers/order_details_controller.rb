class OrderDetailsController < ApplicationController
 before_action :set_order

  # Creates the order detail and sets to cart.
  def create
    @order_detail = @order.order_details.create(order_params)
    @order_details = current_order.order_details

    flash[:notice] = " #{@current_order.order_details.first.laptop.name} added to cart."

    redirect_back_or_to request.referer
  end

  # Updates the cart
  def update
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update(order_params)
    @order_details = current_order.order_details

    flash[:notice] = " #{@order_detail.laptop.name} updated from cart."

    redirect_back_or_to request.referer
  end

  # Destroys the cart
  def destroy
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.destroy
    @order_details = current_order.order_details

    flash[:notice] = " #{@order_detail.laptop.name} removed from cart."

    redirect_back_or_to request.referer
  end

  private
  def order_params
    params.require(:order_detail).permit(:laptop_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end
