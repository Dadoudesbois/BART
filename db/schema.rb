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

ActiveRecord::Schema.define(version: 2019_08_19_115050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_bars_on_users_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "start_date"
    t.string "end_date"
    t.string "status"
    t.text "description"
    t.string "photo"
    t.string "name"
    t.bigint "users_id"
    t.bigint "bars_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bars_id"], name: "index_events_on_bars_id"
    t.index ["users_id"], name: "index_events_on_users_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "date"
    t.text "content"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "url"
    t.bigint "bars_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bars_id"], name: "index_pictures_on_bars_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "address"
    t.string "photo"
    t.text "artist_description"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_profiles_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bars", "users", column: "users_id"
  add_foreign_key "events", "bars", column: "bars_id"
  add_foreign_key "events", "users", column: "users_id"
  add_foreign_key "pictures", "bars", column: "bars_id"
  add_foreign_key "profiles", "users", column: "users_id"
end
