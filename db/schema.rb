# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_25_190805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendars", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_favorites_on_recipe_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "tagname"
    t.datetime "date"
    t.bigint "recipe_id", null: false
    t.bigint "calendar_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["calendar_id"], name: "index_meals_on_calendar_id"
    t.index ["recipe_id"], name: "index_meals_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "ingredients", default: [], array: true
    t.text "instructions", default: [], array: true
    t.bigint "user_id", null: false
    t.boolean "displayed", default: true
    t.integer "serving"
    t.integer "preptime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "description"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_reviews_on_recipe_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "calendar_id", null: false
    t.index ["calendar_id"], name: "index_users_on_calendar_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "recipes"
  add_foreign_key "favorites", "users"
  add_foreign_key "meals", "calendars"
  add_foreign_key "meals", "recipes"
  add_foreign_key "recipes", "users"
  add_foreign_key "reviews", "recipes"
  add_foreign_key "reviews", "users"
  add_foreign_key "users", "calendars"
end
