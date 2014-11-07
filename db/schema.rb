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

ActiveRecord::Schema.define(version: 20141107070539) do

  create_table "authentications", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id"

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "slice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "comments", ["slice_id"], name: "index_comments_on_slice_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "identities", force: true do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "user_id"
    t.string   "confirm_token"
    t.datetime "confirm_sent_at"
    t.datetime "confirmed_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "website"
    t.string   "location"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "slices", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
    t.integer  "user_id"
  end

  add_index "slices", ["user_id"], name: "index_slices_on_user_id"

  create_table "users", force: true do |t|
    t.string   "nickname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
  end

end
