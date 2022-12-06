class ApplicationController < ActionController::Base
  before_action :Initialize_session
  helper_method :cart

  protect_from_forgery with: :exception

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
end
