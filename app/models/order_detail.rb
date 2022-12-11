class OrderDetail < ApplicationRecord

  # Many to Many for Laptops by connecting order (see order)
  belongs_to :order
  belongs_to :laptop

  before_save :set_price
  before_save :set_total

  # Gets the Price
  def price
    if persisted?
      self[:price]
    else
      laptop.price
    end
  end

  # Gets the Total
  def total
    return price * quantity
  end

  # Stripe Builder
  def to_builder
    Jbuilder.new do |item|
      item.quantity quantity
      item.price_data laptop.to_builder
    end
  end

  # Sets the Price and Total
  private
  def set_price
    self[:price] = price
  end

  def set_total
    self[:total] = total * quantity
  end
end
