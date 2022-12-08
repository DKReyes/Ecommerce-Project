class Order < ApplicationRecord
  has_many :order_details
  belongs_to :user, optional: true
  before_save :set_price_total

  # validates :price_total, :status, presence: true
  belongs_to :user, optional: true
  validates :user_id, presence: false

  def price_total
    order_details.collect { |order_detail| order_detail.valid? ? order_detail.price * order_detail.quantity : 0 }.sum
  end

  private
  def set_price_total
    self[:price_total] = price_total
  end
end
