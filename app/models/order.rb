class Order < ApplicationRecord
  has_many :order_details
  belongs_to :user, optional: true

  # validates :price_total, :status, presence: true
  belongs_to :user, optional: true

  validates :user_id, presence: false

  # def amount
  #   order_details.collect { |order_detail| order_detail.valid? ? order_detail.unit_price * order_detail.quantity : 0 }.sum
  # end

  # private
  # def set_amount
  #   self[:amount] = amount
  # end
end
