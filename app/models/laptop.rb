class Laptop < ApplicationRecord
  has_many :orders
  belongs_to :categories

  validates :name, :price, :stock, presence: true
  validates :stock, numericality: {only_integer: true}
end
