# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160522163638) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.integer  "pickup_location_id",  limit: 4
    t.integer  "dropoff_location_id", limit: 4
    t.integer  "trip_type",           limit: 4
    t.integer  "helper_class",        limit: 4
    t.integer  "hourly_rate",         limit: 4
    t.decimal  "total_fee",                       precision: 10
    t.integer  "server_id",           limit: 4
    t.integer  "status",              limit: 4
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "pickup_address",      limit: 255
    t.string   "dropoff_address",     limit: 255
    t.integer  "hours",               limit: 4,                  default: 2, null: false
  end

  add_index "bookings", ["dropoff_location_id"], name: "index_bookings_on_dropoff_location_id", using: :btree
  add_index "bookings", ["pickup_location_id"], name: "index_bookings_on_pickup_location_id", using: :btree
  add_index "bookings", ["server_id"], name: "index_bookings_on_server_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "location_type", limit: 4,   default: 2
    t.integer  "district",      limit: 4
    t.string   "address_1",     limit: 255
    t.string   "address_2",     limit: 255
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "token",      limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "role",                   limit: 4
    t.string   "invitation_token",       limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",       limit: 4
    t.integer  "invited_by_id",          limit: 4
    t.string   "invited_by_type",        limit: 255
    t.integer  "invitations_count",      limit: 4,   default: 0
    t.string   "qualification",          limit: 255
    t.integer  "phone_no",               limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bookings", "users"
  add_foreign_key "locations", "users"
end
