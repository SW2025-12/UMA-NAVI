# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_12_10_064158) do
  create_table "entries", force: :cascade do |t|
    t.integer "horse_id", null: false
    t.integer "race_id", null: false
    t.integer "rank"
    t.string "jockey"
    t.integer "weight"
    t.decimal "odds"
    t.string "payout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["horse_id"], name: "index_entries_on_horse_id"
    t.index ["race_id"], name: "index_entries_on_race_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "horse_id", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["horse_id"], name: "index_favorites_on_horse_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "horses", force: :cascade do |t|
    t.string "name"
    t.string "sire"
    t.string "mare"
    t.string "trainer"
    t.string "owner"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.datetime "race_date"
    t.string "course"
    t.integer "distance"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.string "location"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "entries", "horses"
  add_foreign_key "entries", "races"
  add_foreign_key "favorites", "horses"
  add_foreign_key "favorites", "users"
end
