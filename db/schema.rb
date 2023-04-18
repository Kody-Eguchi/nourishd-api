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

ActiveRecord::Schema.define(version: 2023_04_18_191335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "calories", precision: 10, scale: 5, default: "0.0"
    t.decimal "fat", precision: 10, scale: 5, default: "0.0"
    t.decimal "carbohydrates", precision: 10, scale: 6, default: "0.0"
    t.decimal "sodium", precision: 10, scale: 6, default: "0.0"
    t.decimal "sugar", precision: 10, scale: 6, default: "0.0"
    t.decimal "protein", precision: 10, scale: 6, default: "0.0"
    t.decimal "fiber", precision: 10, scale: 6, default: "0.0"
    t.decimal "potassium", precision: 10, scale: 5, default: "0.0"
    t.decimal "vitamin_a", precision: 10, scale: 5, default: "0.0"
    t.decimal "vitamin_c", precision: 10, scale: 6, default: "0.0"
    t.decimal "calcium", precision: 10, scale: 5, default: "0.0"
    t.decimal "iron", precision: 10, scale: 5, default: "0.0"
    t.decimal "cholesterol", precision: 10, scale: 5, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_days_on_user_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id"
    t.text "recipes", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "weight"
    t.integer "height"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sex"
  end

  add_foreign_key "days", "users"
  add_foreign_key "favourites", "users"
end
