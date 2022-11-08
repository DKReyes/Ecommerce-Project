class OrderDetail < ApplicationRecord
  belongs_to :order_id
  belongs_to :laptop_id
end
