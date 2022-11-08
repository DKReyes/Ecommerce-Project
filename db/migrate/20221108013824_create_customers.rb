class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :admin
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
