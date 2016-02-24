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

ActiveRecord::Schema.define(version: 20160224053115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "claims", force: :cascade do |t|
    t.string   "surname",            limit: 255
    t.string   "name",               limit: 255
    t.string   "patronymic",         limit: 255
    t.string   "email",              limit: 255
    t.date     "birthdate"
    t.string   "gender",             limit: 255
    t.string   "contact_phone",      limit: 255
    t.string   "work_phone",         limit: 255
    t.string   "academic_degree",    limit: 255
    t.string   "academic_status",    limit: 255
    t.string   "post",               limit: 255
    t.text     "organization_title"
    t.string   "organization_abbr",  limit: 255
    t.string   "postcode",           limit: 255
    t.string   "country",            limit: 255
    t.string   "region",             limit: 255
    t.string   "district",           limit: 255
    t.string   "locality",           limit: 255
    t.string   "street",             limit: 255
    t.string   "house",              limit: 255
    t.string   "building",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "working_address"
    t.string   "title_of_report"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "context_id"
    t.string   "context_type", limit: 255
    t.string   "role",         limit: 255
    t.string   "user_id",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permissions", ["user_id", "role", "context_id", "context_type"], name: "by_user_and_role_and_context", unique: true, using: :btree

  create_table "reports", force: :cascade do |t|
    t.text     "title"
    t.text     "authors"
    t.string   "kind",                    limit: 255
    t.string   "section",                 limit: 255
    t.text     "annotation"
    t.integer  "claim_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.text     "attachment_url"
  end

end
