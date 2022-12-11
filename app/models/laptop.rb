class Laptop < ApplicationRecord
  default_per_page

  # Many to Many connecting orders_details
  has_many :order_details
  # One to Many relationship with category
  belongs_to :category
  has_one_attached :image

  validates :name, :cpu, :gpu, :storage, :price, :stock, presence: true
  validates :stock, numericality: {only_integer: true}

  def multiply_price
    (self.price * 100 ).to_i
  end

  # Stripe JBuillder
  def to_builder
    Jbuilder.new do |laptop|
      laptop.currency "cad"

      if laptop.price == laptop.discount
        laptop.unit_amount (multiply_price).to_i
      else
        laptop.unit_amount (multiply_price).to_i
      end

      laptop.product_data self.display_name
    end
  end

  # The display name and gpu as description for stripe
  def display_name
    Jbuilder.new do |laptop|
      laptop.name self.name
      laptop.description self.gpu
    end
  end
end
