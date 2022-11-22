class Laptop < ApplicationRecord
  default_per_page

  has_many :order
  belongs_to :category

  validates :name, :cpu, :gpu, :storage, :price, :stock, presence: true
  validates :stock, numericality: {only_integer: true}
end
