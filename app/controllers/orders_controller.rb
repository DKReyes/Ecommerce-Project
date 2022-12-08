class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])

    @line_items = Stripe::Checkout::Session.list_line_items(@order.payment)
  end

  def admin
  end
end
