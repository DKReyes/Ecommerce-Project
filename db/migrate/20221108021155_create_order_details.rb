class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.decimal :price
      t.integer :quantity
      t.references :order, null: false, foreign_key: true
      t.references :laptop, null: false, foreign_key: true
      t.decimal :discount

      t.timestamps
    end
  end
end
