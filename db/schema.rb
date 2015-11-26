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

ActiveRecord::Schema.define(version: 20151113193626) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "population",  limit: 255
    t.string   "man",         limit: 255
    t.string   "woman",       limit: 255
    t.integer  "ranking",     limit: 4
    t.integer  "smart_index", limit: 4
    t.integer  "visitors",    limit: 4
    t.integer  "commitment",  limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.string   "slug",        limit: 255
    t.string   "country",     limit: 255
    t.string   "title",       limit: 255
    t.string   "subtitle",    limit: 255
  end

  create_table "images", force: :cascade do |t|
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.integer  "post_id",           limit: 4
    t.integer  "project_id",        limit: 4
    t.integer  "city_id",           limit: 4
    t.integer  "user_id",           limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "cover",             limit: 1,   default: false
  end

  add_index "images", ["city_id"], name: "index_images_on_city_id", using: :btree
  add_index "images", ["post_id"], name: "index_images_on_post_id", using: :btree
  add_index "images", ["project_id"], name: "index_images_on_project_id", using: :btree
  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

  create_table "phases", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "post_subcategories", force: :cascade do |t|
    t.integer  "post_id",        limit: 4
    t.integer  "subcategory_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "post_subcategories", ["post_id"], name: "index_post_subcategories_on_post_id", using: :btree
  add_index "post_subcategories", ["subcategory_id"], name: "index_post_subcategories_on_subcategory_id", using: :btree

  create_table "post_targets", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "target_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "post_targets", ["post_id"], name: "index_post_targets_on_post_id", using: :btree
  add_index "post_targets", ["target_id"], name: "index_post_targets_on_target_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.integer  "project_type_id", limit: 4
    t.text     "description",     limit: 65535
    t.text     "benefit",         limit: 65535
    t.text     "solved_problems", limit: 65535
    t.integer  "target_id",       limit: 4
    t.integer  "category_id",     limit: 4
    t.string   "link",            limit: 255
    t.integer  "city_id",         limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "priority_id",     limit: 4
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["city_id"], name: "index_posts_on_city_id", using: :btree
  add_index "posts", ["priority_id"], name: "index_posts_on_priority_id", using: :btree
  add_index "posts", ["project_type_id"], name: "index_posts_on_project_type_id", using: :btree
  add_index "posts", ["target_id"], name: "index_posts_on_target_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "priorities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "product_subcategories", force: :cascade do |t|
    t.integer  "product_id",     limit: 4
    t.integer  "subcategory_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "product_subcategories", ["product_id"], name: "index_product_subcategories_on_product_id", using: :btree
  add_index "product_subcategories", ["subcategory_id"], name: "index_product_subcategories_on_subcategory_id", using: :btree

  create_table "project_subcategories", force: :cascade do |t|
    t.integer  "project_id",     limit: 4
    t.integer  "subcategory_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "project_subcategories", ["project_id"], name: "index_project_subcategories_on_project_id", using: :btree
  add_index "project_subcategories", ["subcategory_id"], name: "index_project_subcategories_on_subcategory_id", using: :btree

  create_table "project_targets", force: :cascade do |t|
    t.integer  "project_id", limit: 4
    t.integer  "target_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "project_targets", ["project_id"], name: "index_project_targets_on_project_id", using: :btree
  add_index "project_targets", ["target_id"], name: "index_project_targets_on_target_id", using: :btree

  create_table "project_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.integer  "project_type_id",  limit: 4
    t.text     "description",      limit: 65535
    t.text     "benefit",          limit: 65535
    t.text     "solved_problems",  limit: 65535
    t.integer  "target_id",        limit: 4
    t.integer  "category_id",      limit: 4
    t.string   "link",             limit: 255
    t.integer  "city_id",          limit: 4
    t.integer  "user_id",          limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "status",           limit: 255,   default: "pending"
    t.integer  "priority_id",      limit: 4
    t.integer  "subcategories_id", limit: 4
    t.integer  "subcategory_id",   limit: 4
    t.integer  "phase_id",         limit: 4
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id", using: :btree
  add_index "projects", ["city_id"], name: "index_projects_on_city_id", using: :btree
  add_index "projects", ["phase_id"], name: "index_projects_on_phase_id", using: :btree
  add_index "projects", ["priority_id"], name: "index_projects_on_priority_id", using: :btree
  add_index "projects", ["project_type_id"], name: "index_projects_on_project_type_id", using: :btree
  add_index "projects", ["subcategories_id"], name: "index_projects_on_subcategories_id", using: :btree
  add_index "projects", ["subcategory_id"], name: "index_projects_on_subcategory_id", using: :btree
  add_index "projects", ["target_id"], name: "index_projects_on_target_id", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "relations", force: :cascade do |t|
    t.integer  "project_id",     limit: 4
    t.integer  "subcategory_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "relations", ["project_id"], name: "index_relations_on_project_id", using: :btree
  add_index "relations", ["subcategory_id"], name: "index_relations_on_subcategory_id", using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.integer  "category_id", limit: 4
    t.integer  "combination", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "targets", force: :cascade do |t|
    t.string   "name",       limit: 255
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
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "post_subcategories", "posts"
  add_foreign_key "post_subcategories", "subcategories"
  add_foreign_key "post_targets", "posts"
  add_foreign_key "post_targets", "targets"
  add_foreign_key "posts", "priorities"
  add_foreign_key "project_subcategories", "projects"
  add_foreign_key "project_subcategories", "subcategories"
  add_foreign_key "project_targets", "projects"
  add_foreign_key "project_targets", "targets"
  add_foreign_key "projects", "phases"
  add_foreign_key "projects", "priorities"
  add_foreign_key "projects", "subcategories"
  add_foreign_key "relations", "projects"
  add_foreign_key "relations", "subcategories"
end
