class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception
  before_action :Initialize_session
  helper_method :cart
  helper_method :current_order
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:address, :province_id, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :address, :province_id, :email, :password, :password_confirmation, :current_password) }
  end

  private
  def Initialize_session
    # Will Initialize the visit count to zero for new users.
    session[:shopping_cart] ||= []
  end

  def cart
    # Pass an array of laptop IDs and get back a collection of laptops.
    Laptop.find(session[:shopping_cart])
  end

  def current_order
    if session[:orders_id]
      @current_order ||= Order.find(session[:orders_id])
      session[:orders_id] = nil if @current_order.status
    end

    if session[:orders_id].nil?
      @current_order = Order.create!
      session[:orders_id] = @current_order.id
    end

    @current_order
  end

end
