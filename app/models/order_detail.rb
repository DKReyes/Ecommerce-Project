class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :laptops

  validates :price, :quantity, presence: true
  validates :quantity, numericality: {only_integer: true}

  # before_save :set_unit_price
  # before_save :set_total

  # def unit_price
  #   if persisted?
  #     self[:unit_price]
  #   else
  #     laptop.price
  #   end
  # end

  # def total
  #   return unit_price * quantity
  # end

  # # def to_builder
  # #   Jbuilder.new do |item|
  # #     item.quantity quantity
  # #     item.price_data laptop.to_builder
  # #   end
  # # end

  # private

  # def set_unit_price
  #   self[:unit_price] = unit_price
  # end

  # def set_total
  #   self[:total] = total * quantity
  # end
end
