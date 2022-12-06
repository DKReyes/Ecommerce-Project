class AddPaymentToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :payment, :string
  end
end
