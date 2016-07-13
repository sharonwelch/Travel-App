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

ActiveRecord::Schema.define(version: 20160712144633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "instructor_id"
    t.string   "location"
    t.string   "price"
    t.string   "duration"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "activity_photo_file_name"
    t.string   "activity_photo_content_type"
    t.integer  "activity_photo_file_size"
    t.datetime "activity_photo_updated_at"
    t.string   "availability"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "fullname"
    t.string   "email"
    t.boolean  "current_admin"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "instructor_apps", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "instagram_handle"
    t.string   "blog_url"
    t.string   "facebook_url"
    t.string   "other_social_media"
    t.string   "activities"
    t.text     "love_about_hometown"
    t.text     "who_are"
    t.text     "unique_thing"
    t.text     "activity_desc"
    t.string   "activity_title"
    t.string   "why_share"
    t.string   "workflow_state"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "app_photo_file_name"
    t.string   "app_photo_content_type"
    t.integer  "app_photo_file_size"
    t.datetime "app_photo_updated_at"
  end

  create_table "instructors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "instructor_apps_id"
    t.text     "story"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "instructor_photo_file_name"
    t.string   "instructor_photo_content_type"
    t.integer  "instructor_photo_file_size"
    t.datetime "instructor_photo_updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "content"
    t.integer  "activity_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "possible_start_1"
    t.datetime "possible_end_1"
    t.datetime "possible_start_2"
    t.datetime "possible_end_2"
    t.datetime "possible_start_3"
    t.datetime "possible_end_3"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "activity_id"
    t.integer  "instructor_id"
    t.integer  "user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "through_ats", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "tag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "is_admin"
    t.boolean  "is_instructor"
    t.boolean  "is_customer"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
