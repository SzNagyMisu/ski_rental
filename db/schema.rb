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

ActiveRecord::Schema.define(version: 20170204095647) do

  create_table "boxes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "col"
    t.integer  "row"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "serial"
    t.integer  "box_id"
    t.string   "customer_name"
    t.string   "customer_identifier"
    t.integer  "days"
    t.boolean  "is_active"
    t.integer  "payed"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["box_id"], name: "index_rentals_on_box_id", using: :btree
  end

  add_foreign_key "rentals", "boxes"
end
