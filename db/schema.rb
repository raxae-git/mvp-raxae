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

ActiveRecord::Schema.define(version: 2020_09_06_184520) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "beta_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "messaging_service"
    t.string "service_of_interest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deleted_beta_users", force: :cascade do |t|
    t.string "name"
    t.date "entry_date"
    t.date "departure_date"
    t.string "reason"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "id_deleted"
  end

  create_table "deleted_groups", force: :cascade do |t|
    t.string "name"
    t.integer "service_id", null: false
    t.integer "payment_id", null: false
    t.integer "id_deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_id"], name: "index_deleted_groups_on_payment_id"
    t.index ["service_id"], name: "index_deleted_groups_on_service_id"
  end

  create_table "deleted_members", force: :cascade do |t|
    t.string "name"
    t.integer "group_id", null: false
    t.boolean "leader"
    t.string "reason"
    t.date "entry_date"
    t.date "departure_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "deleted_group_id", null: false
    t.integer "deleted_beta_user_id", null: false
    t.integer "beta_user_id", null: false
    t.index ["beta_user_id"], name: "index_deleted_members_on_beta_user_id"
    t.index ["deleted_beta_user_id"], name: "index_deleted_members_on_deleted_beta_user_id"
    t.index ["deleted_group_id"], name: "index_deleted_members_on_deleted_group_id"
    t.index ["group_id"], name: "index_deleted_members_on_group_id"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "leader_group_id", null: false
    t.integer "member_group_id", null: false
    t.integer "service_id", null: false
    t.decimal "value"
    t.index ["leader_group_id"], name: "index_groups_on_leader_group_id"
    t.index ["member_group_id"], name: "index_groups_on_member_group_id"
    t.index ["service_id"], name: "index_groups_on_service_id"
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

  create_table "payments", force: :cascade do |t|
    t.float "value"
    t.string "kind"
    t.date "effective_date"
    t.integer "member_group_id", null: false
    t.integer "leader_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "deleted_member_id", null: false
    t.index ["deleted_member_id"], name: "index_payments_on_deleted_member_id"
    t.index ["leader_group_id"], name: "index_payments_on_leader_group_id"
    t.index ["member_group_id"], name: "index_payments_on_member_group_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.string "kind"
    t.string "description"
    t.decimal "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "deleted_groups", "payments"
  add_foreign_key "deleted_groups", "services"
  add_foreign_key "deleted_members", "beta_users"
  add_foreign_key "deleted_members", "deleted_beta_users"
  add_foreign_key "deleted_members", "deleted_groups"
  add_foreign_key "deleted_members", "groups"
  add_foreign_key "group_dates", "beta_users"
  add_foreign_key "group_dates", "groups"
  add_foreign_key "groups", "leader_groups"
  add_foreign_key "groups", "member_groups"
  add_foreign_key "groups", "services"
  add_foreign_key "leader_groups", "beta_users"
  add_foreign_key "leader_groups", "groups"
  add_foreign_key "member_groups", "beta_users"
  add_foreign_key "member_groups", "groups"
  add_foreign_key "payments", "deleted_members"
  add_foreign_key "payments", "leader_groups"
  add_foreign_key "payments", "member_groups"
end
