# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180223123217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.bigint "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_groups_on_section_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.string "brand_name"
    t.integer "qualntity"
    t.integer "open_stck"
    t.integer "clasing_stock"
    t.decimal "cost_price"
    t.decimal "sell_price"
    t.decimal "profit"
    t.integer "sold_stock"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_items_on_group_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "contact"
    t.string "role"
    t.text "address"
    t.string "username"
    t.string "password_digest"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_managers_on_store_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "contact"
    t.string "role"
    t.text "address"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.string "store"
    t.string "section"
    t.string "group"
    t.integer "quantity"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "store_id"
    t.index ["item_id"], name: "index_records_on_item_id"
    t.index ["store_id"], name: "index_records_on_store_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "sec_code"
    t.string "name"
    t.string "desc"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_sections_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "storereg_no"
    t.string "name"
    t.text "address"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "groups", "sections"
  add_foreign_key "items", "groups"
  add_foreign_key "managers", "stores"
  add_foreign_key "records", "items"
  add_foreign_key "records", "stores"
  add_foreign_key "sections", "stores"
end
