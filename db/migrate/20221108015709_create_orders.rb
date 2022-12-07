class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :price_total
      t.string :status
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
