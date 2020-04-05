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

ActiveRecord::Schema.define(version: 2020_03_19_092742) do

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "flight_class", null: false
    t.string "country", null: false
    t.date "departure_day", null: false
    t.string "departure", null: false
    t.string "destination", null: false
    t.date "return_day", null: false
    t.string "hotel", null: false
    t.text "remarks"
    t.text "policy"
    t.string "airline"
    t.string "flight_schedule"
    t.string "flight_rate"
    t.string "hotel_rate"
    t.string "decision"
    t.string "issue"
    t.bigint "user_id"
    t.bigint "estimate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estimate_id"], name: "index_bookings_on_estimate_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "decisions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "purpose", null: false
    t.string "rate", null: false
    t.date "application_date", null: false
    t.date "completed"
    t.boolean "approval"
    t.string "authorizer"
    t.bigint "user_id"
    t.bigint "booking_id"
    t.bigint "estimate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_decisions_on_booking_id"
    t.index ["estimate_id"], name: "index_decisions_on_estimate_id"
    t.index ["user_id"], name: "index_decisions_on_user_id"
  end

  create_table "estimates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "country", null: false
    t.datetime "departure_day", null: false
    t.string "departure", null: false
    t.string "destination", null: false
    t.datetime "return_day", null: false
    t.string "hotel", null: false
    t.text "remarks"
    t.text "policy"
    t.string "airline"
    t.string "flight_schedule"
    t.string "flight_rate"
    t.string "hotel_rate"
    t.string "decision"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "flight_class"
    t.index ["user_id"], name: "index_estimates_on_user_id"
  end

  create_table "expenses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "application_date", null: false
    t.string "travel_cost", null: false
    t.string "approver"
    t.date "completed"
    t.boolean "approval"
    t.bigint "user_id"
    t.bigint "decision_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_expenses_on_booking_id"
    t.index ["decision_id"], name: "index_expenses_on_decision_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "receipts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image"
    t.bigint "expense_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_receipts_on_expense_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "firstname_kana", null: false
    t.string "lastname_kana", null: false
    t.string "passport_number", null: false
    t.datetime "passport_valid", null: false
    t.datetime "birthday", null: false
    t.string "mileage"
    t.string "seat_request"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin_flg"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "estimates"
  add_foreign_key "bookings", "users"
  add_foreign_key "decisions", "bookings"
  add_foreign_key "decisions", "estimates"
  add_foreign_key "decisions", "users"
  add_foreign_key "estimates", "users"
  add_foreign_key "expenses", "bookings"
  add_foreign_key "expenses", "decisions"
  add_foreign_key "expenses", "users"
  add_foreign_key "receipts", "expenses"
end
