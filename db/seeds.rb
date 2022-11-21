# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
require 'faker'

Laptop.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/Final_Dataframe.csv')
csv_data = File.read(csv_file)

laptops = CSV.parse(csv_data, headers: true)

laptops.each do |data|
  category = Category.find_or_create_by(name: data["brand"])

  if category && category.valid?
    category.laptop.create(
      name: data["laptop_name"],
      cpu: data["processor_type"],
      gpu: data["graphics_card"],
      storage: data["disk_space"],
      display: data["display_size"],
      # photo: Faker::LoremFlickr.image(size: "50x60", search_terms: ['laptops'])
      price: data["old_price"],
      stock: Faker::Number.between(from: 0, to: 12),
      discount: data["discount_price"]
    )
  end
end

# laptops.each do |data|
#   Laptop.create(
#     name: data["laptop_name"],
#     # photo: Faker::LoremFlickr.image(size: "50x60", search_terms: ['laptops'])
#     price: data["old_price"],
#     stock: Faker::Number.between(from: 0, to: 12),
#     discount: data["discount_price"]
#   )
# end

