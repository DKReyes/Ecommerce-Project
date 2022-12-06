class Order < ApplicationRecord
  has_many :order_details
  belongs_to :user

  validates :price_total, :status, presence: true
end
