# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140107135024) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "bills", force: true do |t|
    t.float    "multiplier"
    t.date     "month"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bills", ["month"], name: "index_bills_on_month", unique: true

  create_table "bio_practices", force: true do |t|
    t.string   "name"
    t.float    "ub"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_lines", force: true do |t|
    t.integer  "order_id"
    t.integer  "bio_practice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_lines", ["order_id", "bio_practice_id"], name: "index_order_lines_on_order_id_and_bio_practice_id", unique: true

  create_table "orders", force: true do |t|
    t.integer  "bill_id"
    t.string   "patient_name"
    t.integer  "patient_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["bill_id"], name: "index_orders_on_bill_id"

end
