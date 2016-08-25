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

ActiveRecord::Schema.define(version: 20160825102051) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "courses", force: true do |t|
    t.string   "title"
    t.text     "short_descr"
    t.text     "full_descr"
    t.date     "start_date"
    t.decimal  "full_price"
    t.integer  "timegroup"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.float    "duration"
    t.integer  "advance_payment"
    t.integer  "monthly_payment"
    t.boolean  "published",                   default: true
    t.string   "panel0_title"
    t.text     "panel0_content"
    t.string   "panel1_title"
    t.text     "panel1_content"
    t.string   "panel2_title"
    t.text     "panel2_content"
    t.string   "panel3_title"
    t.text     "panel3_content"
    t.string   "panel4_title"
    t.text     "panel4_content"
    t.string   "panel5_title"
    t.text     "panel5_content"
    t.string   "panel6_title"
    t.text     "panel6_content"
    t.string   "panel7_title"
    t.text     "panel7_content"
    t.string   "curriculum0_title"
    t.text     "curriculum0_content"
    t.string   "curriculum1_title"
    t.text     "curriculum1_content"
    t.string   "curriculum2_title"
    t.text     "curriculum2_content"
    t.string   "curriculum3_title"
    t.text     "curriculum3_content"
    t.string   "curriculum4_title"
    t.text     "curriculum4_content"
    t.string   "curriculum5_title"
    t.text     "curriculum5_content"
    t.string   "curriculum6_title"
    t.text     "curriculum6_content"
    t.string   "curriculum7_title"
    t.text     "curriculum7_content"
    t.string   "curriculum8_title"
    t.text     "curriculum8_content"
    t.string   "curriculum9_title"
    t.text     "curriculum9_content"
    t.string   "curriculum10_title"
    t.text     "curriculum10_content"
    t.string   "curriculum11_title"
    t.text     "curriculum11_content"
    t.string   "curriculum12_title"
    t.text     "curriculum12_content"
    t.string   "curriculum13_title"
    t.text     "curriculum13_content"
    t.string   "curriculum14_title"
    t.text     "curriculum14_content"
  end

  create_table "feedbacks", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_for_hr_services"
    t.boolean  "published"
  end

  add_index "feedbacks", ["course_id"], name: "index_feedbacks_on_course_id"

  create_table "hot_offers", force: true do |t|
    t.text     "content",    limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.text     "content"
    t.datetime "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "signups", force: true do |t|
    t.integer  "course",     limit: 255
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
  end

  create_table "static_pages", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subtitle"
  end

end
