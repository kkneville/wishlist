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

ActiveRecord::Schema.define(version: 20171026234114) do

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "depts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "messages", ["recipient_id"], name: "index_pms_on_recipient_id"
  add_index "messages", ["sender_id"], name: "index_pms_on_sender_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "santa", force: :cascade do |t|
    t.integer  "gifter_id"
    t.integer  "giftee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "santa", ["giftee_id"], name: "index_santa_on_giftee_id"
  add_index "santa", ["gifter_id"], name: "index_santa_on_gifter_id"

  create_table "supervisions", force: :cascade do |t|
    t.integer  "lead_id"
    t.integer  "dr_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "supervisions", ["dr_id"], name: "index_supervisions_on_dr_id"
  add_index "supervisions", ["lead_id"], name: "index_supervisions_on_lead_id"

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "dob"
    t.string   "country"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "level",           default: "reg"
    t.integer  "dept_id"
  end

  create_table "wishes", force: :cascade do |t|
    t.integer  "wisher_id"
    t.integer  "wished_for_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "wishes", ["wished_for_id"], name: "index_wishes_on_wished_for_id"
  add_index "wishes", ["wisher_id"], name: "index_wishes_on_wisher_id"

end
