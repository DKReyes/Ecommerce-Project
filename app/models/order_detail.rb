class OrderDetail < ApplicationRecord
  belongs_to :orders
  belongs_to :laptops
end
