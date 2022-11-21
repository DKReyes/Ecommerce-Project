class CreateLaptops < ActiveRecord::Migration[7.0]
  def change
    create_table :laptops do |t|
      t.string :name
      t.decimal :price
      t.integer :stock
      t.decimal :discount
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
