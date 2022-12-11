class Category < ApplicationRecord
  has_many :laptop

  # Validations
  validates :name, presence: true
end
