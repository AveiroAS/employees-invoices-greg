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

ActiveRecord::Schema.define(version: 20150303094410) do

  create_table "documents", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "file_name"
    t.string   "file_uid"
    t.string   "name"
    t.text     "description"
    t.float    "amount"
    t.boolean  "approved"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "documents", ["user_id"], name: "index_documents_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "image_name"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["token"], name: "index_users_on_token"
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider"

end
