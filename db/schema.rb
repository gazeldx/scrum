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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130627073859) do

  create_table "class_photos", :force => true do |t|
    t.integer  "course_id"
    t.string   "avatar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name_zh"
    t.string   "location_zh"
    t.text     "description_zh"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "trainer_id"
    t.integer  "status",         :default => 1
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "city_zh"
    t.string   "discount_zh"
    t.string   "name_en"
    t.string   "description_en"
    t.string   "city_en"
    t.string   "location_en"
    t.string   "discount_en"
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.text     "body"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news_and_events", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "abstract"
    t.datetime "posted_on"
    t.string   "category"
    t.string   "ref_link"
    t.string   "status"
    t.string   "keywords"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "news_and_events", ["category"], :name => "index_news_and_events_on_category"
  add_index "news_and_events", ["posted_on"], :name => "index_news_and_events_on_posted_on"
  add_index "news_and_events", ["status"], :name => "index_news_and_events_on_status"
  add_index "news_and_events", ["title"], :name => "index_news_and_events_on_title"

  create_table "registers", :force => true do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "email"
    t.string   "company_name"
    t.integer  "headcount",    :default => 1
    t.integer  "course_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "remarks"
  end

  create_table "trainers", :force => true do |t|
    t.string   "name_zh"
    t.text     "description_zh"
    t.string   "email"
    t.string   "url"
    t.string   "phone"
    t.string   "avatar"
    t.text     "bio_zh"
    t.string   "base"
    t.string   "work_as_zh"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "name_en"
    t.string   "description_en"
    t.string   "bio_en"
    t.string   "work_as_en"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
