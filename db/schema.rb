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

ActiveRecord::Schema.define(version: 2020_09_01_112803) do

  create_table "beta_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "messaging_service"
    t.string "service_of_interest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "group_dates", force: :cascade do |t|
    t.date "entry_date"
    t.integer "date_transfer"
    t.integer "charge_day"
    t.integer "group_id", null: false
    t.integer "beta_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beta_user_id"], name: "index_group_dates_on_beta_user_id"
    t.index ["group_id"], name: "index_group_dates_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "service"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "leader_group_id", null: false
    t.integer "member_group_id", null: false
    t.index ["leader_group_id"], name: "index_groups_on_leader_group_id"
    t.index ["member_group_id"], name: "index_groups_on_member_group_id"
  end

  create_table "leader_groups", force: :cascade do |t|
    t.integer "beta_user_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beta_user_id"], name: "index_leader_groups_on_beta_user_id"
    t.index ["group_id"], name: "index_leader_groups_on_group_id"
  end

  create_table "member_groups", force: :cascade do |t|
    t.integer "beta_user_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["beta_user_id"], name: "index_member_groups_on_beta_user_id"
    t.index ["group_id"], name: "index_member_groups_on_group_id"
  end

  add_foreign_key "group_dates", "beta_users"
  add_foreign_key "group_dates", "groups"
  add_foreign_key "groups", "leader_groups"
  add_foreign_key "groups", "member_groups"
  add_foreign_key "leader_groups", "beta_users"
  add_foreign_key "leader_groups", "groups"
  add_foreign_key "member_groups", "beta_users"
  add_foreign_key "member_groups", "groups"
end
