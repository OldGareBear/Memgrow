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

ActiveRecord::Schema.define(version: 20141104203232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.integer  "course_id",  null: false
    t.string   "character"
    t.string   "pinyin"
    t.string   "english"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "author_id",  null: false
    t.integer  "course_id",  null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["course_id"], name: "index_comments_on_course_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "title",      null: false
    t.string   "category",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
  end

  create_table "enrollments", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "course_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "requester_id",                     null: false
    t.integer  "requestee_id",                     null: false
    t.string   "status",       default: "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["requestee_id"], name: "index_friendships_on_requestee_id", using: :btree
  add_index "friendships", ["requester_id"], name: "index_friendships_on_requester_id", using: :btree

  create_table "user_card_histories", force: true do |t|
    t.integer  "user_id",                  null: false
    t.integer  "card_id",                  null: false
    t.integer  "times_right",  default: 0
    t.integer  "times_wrong",  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_studied"
  end

  add_index "user_card_histories", ["card_id"], name: "index_user_card_histories_on_card_id", using: :btree
  add_index "user_card_histories", ["user_id"], name: "index_user_card_histories_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                       null: false
    t.string   "username"
    t.string   "password_digest",             null: false
    t.string   "session_token",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points",          default: 0
    t.string   "omniauth_id"
    t.string   "filepicker_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree

end
