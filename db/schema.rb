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

ActiveRecord::Schema.define(version: 2019_08_29_090511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_pictures", force: :cascade do |t|
    t.string "photo"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_artist_pictures_on_profile_id"
  end

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_bars_on_user_id"
  end

  create_table "chatboxes", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.index ["recipient_id"], name: "index_chatboxes_on_recipient_id"
    t.index ["sender_id"], name: "index_chatboxes_on_sender_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "status"
    t.text "description"
    t.string "photo"
    t.string "name"
    t.bigint "user_id"
    t.bigint "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
    t.boolean "confirmed", default: false
    t.string "category"
    t.index ["bar_id"], name: "index_events_on_bar_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "date"
    t.string "content"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "chatbox_id"
    t.index ["chatbox_id"], name: "index_messages_on_chatbox_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "photo"
    t.bigint "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_pictures_on_bar_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.string "address"
    t.string "photo"
    t.text "artist_description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_artist", default: false
    t.boolean "is_bar_manager", default: false
    t.float "latitude"
    t.float "longitude"
    t.string "instagram_username"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_reviews_on_event_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "artist_pictures", "profiles"
  add_foreign_key "bars", "users"
  add_foreign_key "chatboxes", "users", column: "recipient_id"
  add_foreign_key "chatboxes", "users", column: "sender_id"
  add_foreign_key "events", "bars"
  add_foreign_key "events", "users"
  add_foreign_key "messages", "chatboxes"
  add_foreign_key "messages", "users"
  add_foreign_key "pictures", "bars"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "events"
  add_foreign_key "reviews", "users"
end
