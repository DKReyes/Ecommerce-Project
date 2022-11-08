class Customer < ApplicationRecord
  validates :name, :email, :password, :address, :phone_number, presence: true
end
