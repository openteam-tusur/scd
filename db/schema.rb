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

ActiveRecord::Schema.define(version: 20160517033232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "claims", force: :cascade do |t|
    t.string   "surname"
    t.string   "name"
    t.string   "patronymic"
    t.string   "email"
    t.string   "academic_degree"
    t.string   "academic_status"
    t.string   "post"
    t.text     "organization_title"
    t.string   "organization_abbr"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "working_address"
    t.string   "title_of_report"
    t.datetime "arrival_time"
    t.string   "arrival_transport"
    t.datetime "departure_time"
    t.string   "departure_transport"
    t.boolean  "already_in_tomsk"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "context_id"
    t.string   "context_type"
    t.string   "role"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["user_id", "role", "context_id", "context_type"], name: "by_user_and_role_and_context", unique: true, using: :btree

  create_table "reports", force: :cascade do |t|
    t.text     "title"
    t.text     "authors"
    t.string   "kind"
    t.string   "section"
    t.text     "annotation"
    t.integer  "claim_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
