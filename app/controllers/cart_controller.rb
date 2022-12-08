class CartController < ApplicationController
  # Old Cart - See Order Details
  def show
    @order_details = current_order.order_details
  end
end
