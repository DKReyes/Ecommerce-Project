class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :laptop

  # validates :price, :quantity, presence: true
  # validates :quantity, numericality: {only_integer: true}

  before_save :set_price
  before_save :set_total

  def price
    if persisted?
      self[:price]
    else
      laptop.price
    end
  end

  def total
    return price * quantity
  end

  # # def to_builder
  # #   Jbuilder.new do |item|
  # #     item.quantity quantity
  # #     item.price_data laptop.to_builder
  # #   end
  # # end

  private
  def set_price
    self[:price] = price
  end

  def set_total
    self[:total] = total * quantity
  end
end
