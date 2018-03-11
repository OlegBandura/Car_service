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

ActiveRecord::Schema.define(version: 20180311075620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "break_categories", force: :cascade do |t|
    t.bigint "garage_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garage_id"], name: "index_break_categories_on_garage_id"
  end

  create_table "break_sub_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name"
    t.money "price", scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_break_sub_categories_on_category_id"
  end

  create_table "car_models", force: :cascade do |t|
    t.bigint "id_brand"
    t.string "model"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_car_models_on_brand_id"
  end

  create_table "comment_garages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "garage_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garage_id"], name: "index_comment_garages_on_garage_id"
    t.index ["user_id"], name: "index_comment_garages_on_user_id"
  end

  create_table "garages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "description"
    t.string "city"
    t.string "address"
    t.string "phone"
    t.boolean "diler"
    t.text "image_url"
    t.string "garage_rating"
    t.string "garage_types", default: [], array: true
    t.string "work_shedule", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_garages_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_car_id"
    t.bigint "garage_id"
    t.bigint "break_sub_category_id"
    t.string "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "times", default: [], array: true
    t.index ["break_sub_category_id"], name: "index_orders_on_break_sub_category_id"
    t.index ["garage_id"], name: "index_orders_on_garage_id"
    t.index ["user_car_id"], name: "index_orders_on_user_car_id"
  end

  create_table "user_cars", force: :cascade do |t|
    t.bigint "car_model_id"
    t.bigint "user_id"
    t.date "car_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_model_id"], name: "index_user_cars_on_car_model_id"
    t.index ["user_id"], name: "index_user_cars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
