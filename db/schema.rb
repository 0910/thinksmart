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

ActiveRecord::Schema.define(version: 20150909174302) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "population"
    t.string   "man"
    t.string   "woman"
    t.integer  "ranking"
    t.integer  "smart_index"
    t.integer  "visitors"
    t.integer  "commitment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "images", force: :cascade do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "post_id"
    t.integer  "project_id"
    t.integer  "city_id"
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "cover",             default: false
  end

  add_index "images", ["city_id"], name: "index_images_on_city_id"
  add_index "images", ["post_id"], name: "index_images_on_post_id"
  add_index "images", ["project_id"], name: "index_images_on_project_id"
  add_index "images", ["user_id"], name: "index_images_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.integer  "project_type_id"
    t.text     "description"
    t.text     "benefit"
    t.text     "solved_problems"
    t.integer  "target_id"
    t.integer  "category_id"
    t.string   "link"
    t.integer  "city_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id"
  add_index "posts", ["city_id"], name: "index_posts_on_city_id"
  add_index "posts", ["project_type_id"], name: "index_posts_on_project_type_id"
  add_index "posts", ["target_id"], name: "index_posts_on_target_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "project_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.integer  "project_type_id"
    t.text     "description"
    t.text     "benefit"
    t.text     "solved_problems"
    t.integer  "target_id"
    t.integer  "category_id"
    t.string   "link"
    t.integer  "city_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id"
  add_index "projects", ["city_id"], name: "index_projects_on_city_id"
  add_index "projects", ["project_type_id"], name: "index_projects_on_project_type_id"
  add_index "projects", ["target_id"], name: "index_projects_on_target_id"
  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "subcategories", force: :cascade do |t|
    t.string   "title"
    t.integer  "category_id"
    t.integer  "combination"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "targets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
