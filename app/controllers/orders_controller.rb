class OrdersController < ApplicationController
  # Displays all the user's order
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  # Shows the exact order with the price and details
  def show
    @order = Order.find(params[:id])

    @line_items = Stripe::Checkout::Session.list_line_items(@order.payment)
  end

end
