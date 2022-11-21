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

ActiveRecord::Schema[7.0].define(version: 2022_11_21_163959) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_laptops_on_category_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.decimal "price"
    t.integer "quantity"
    t.integer "orders_id", null: false
    t.integer "laptops_id", null: false
    t.decimal "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laptops_id"], name: "index_order_details_on_laptops_id"
    t.index ["orders_id"], name: "index_order_details_on_orders_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "price_total"
    t.string "status"
    t.integer "customers_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customers_id"], name: "index_orders_on_customers_id"
  end

  add_foreign_key "laptops", "categories"
  add_foreign_key "order_details", "laptops", column: "laptops_id"
  add_foreign_key "order_details", "orders", column: "orders_id"
  add_foreign_key "orders", "customers", column: "customers_id"
end
