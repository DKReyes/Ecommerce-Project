class ApplicationController < ActionController::Base
  before_action :Initialize_session
  helper_method :cart

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
