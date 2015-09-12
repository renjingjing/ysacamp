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

ActiveRecord::Schema.define(version: 20150912005225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "message"
    t.boolean  "done",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "course_resources", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.string   "resource_file"
    t.string   "note"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "course_unit_id"
    t.integer  "kind_id"
  end

  add_index "course_resources", ["course_unit_id"], name: "index_course_resources_on_course_unit_id", using: :btree
  add_index "course_resources", ["kind_id"], name: "index_course_resources_on_kind_id", using: :btree

  create_table "course_units", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "course_units", ["user_id"], name: "index_course_units_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "kinds", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "kinds", ["user_id"], name: "index_kinds_on_user_id", using: :btree

  create_table "programs", force: :cascade do |t|
    t.string   "course_name"
    t.string   "level"
    t.string   "class_amount"
    t.string   "time_info"
    t.string   "description"
    t.string   "max_students"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "parent_name"
    t.string   "email1"
    t.string   "email2"
    t.string   "password_digest"
    t.string   "address"
    t.string   "cell_phone"
    t.string   "home_phone"
    t.string   "gender"
    t.string   "school"
    t.string   "grade"
    t.integer  "age"
    t.string   "note"
    t.boolean  "admin"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.datetime "registration_time"
    t.integer  "student_id"
  end

  add_foreign_key "course_resources", "course_units"
  add_foreign_key "course_resources", "kinds"
  add_foreign_key "course_units", "users"
  add_foreign_key "kinds", "users"
end
