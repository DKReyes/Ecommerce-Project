class Category < ApplicationRecord
  has_many :laptop

  validates :name, presence: true
end
