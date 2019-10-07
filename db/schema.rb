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

ActiveRecord::Schema.define(version: 2019_10_02_122722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leaves", force: :cascade do |t|
    t.text "reason", null: false
    t.text "status_reason"
    t.integer "status", default: 0, null: false
    t.integer "lock_version"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notification_groups", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "image"
    t.integer "lock_version"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_notification_groups_on_title", unique: true
  end

  create_table "optional_holidays", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.date "date", null: false
    t.integer "lock_version"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "designation", null: false
    t.string "email", null: false
    t.string "mobile", null: false
    t.date "dob", null: false
    t.string "employee_code", null: false
    t.date "joining_date", null: false
    t.date "leaving_date"
    t.string "avatar"
    t.integer "user_group", default: 0, null: false
    t.integer "lock_version"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["designation"], name: "index_users_on_designation"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employee_code"], name: "index_users_on_employee_code", unique: true
    t.index ["mobile"], name: "index_users_on_mobile", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["user_group"], name: "index_users_on_user_group"
  end

end
