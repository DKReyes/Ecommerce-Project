# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_08_021155) do
  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.boolean "admin"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laptops", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "stock"
    t.decimal "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.decimal "price"
    t.integer "quantity"
    t.integer "order_id_id", null: false
    t.integer "laptop_id_id", null: false
    t.decimal "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laptop_id_id"], name: "index_order_details_on_laptop_id_id"
    t.index ["order_id_id"], name: "index_order_details_on_order_id_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "price_total"
    t.string "status"
    t.integer "customer_id_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id_id"], name: "index_orders_on_customer_id_id"
  end

  add_foreign_key "order_details", "laptop_ids"
  add_foreign_key "order_details", "order_ids"
  add_foreign_key "orders", "customer_ids"
end
