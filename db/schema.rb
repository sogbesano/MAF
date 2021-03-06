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

ActiveRecord::Schema.define(version: 20151202184547) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "wine_id"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "surname"
    t.string   "username"
    t.string   "email"
    t.string   "email_confirmation"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "address"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "password_digest"
  end

  create_table "wines", force: :cascade do |t|
    t.string   "name"
    t.string   "shortdesc"
    t.string   "longdesc"
    t.string   "grapetype"
    t.boolean  "forvegeterians"
    t.string   "origin"
    t.string   "bottlesize"
    t.float    "price"
    t.string   "supplier"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end
