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

ActiveRecord::Schema.define(version: 20160322024314) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string   "title",                                   null: false
    t.text     "body"
    t.string   "slug",                                    null: false
    t.boolean  "featured",                default: false
    t.boolean  "visible",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hero_image_file_name"
    t.string   "hero_image_content_type"
    t.integer  "hero_image_file_size"
    t.datetime "hero_image_updated_at"
  end

  add_index "posts", ["featured"], name: "index_posts_on_featured", using: :btree
  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
  add_index "posts", ["visible"], name: "index_posts_on_visible", using: :btree

  create_table "reports", force: :cascade do |t|
    t.string   "title",                    null: false
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "report_file_file_name"
    t.string   "report_file_content_type"
    t.integer  "report_file_file_size"
    t.datetime "report_file_updated_at"
  end

  create_table "testimonials", force: :cascade do |t|
    t.text     "quote",                      null: false
    t.string   "name",                       null: false
    t.boolean  "featured",   default: false
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "testimonials", ["featured"], name: "index_testimonials_on_featured", using: :btree

end
