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

ActiveRecord::Schema.define(:version => 20140220060740) do

  create_table "class_photos", :force => true do |t|
    t.integer  "course_id"
    t.string   "avatar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "body_zh"
    t.string   "comment_by_zh"
    t.text     "body_en"
    t.string   "comment_by_en"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "course_descriptions", :force => true do |t|
    t.string   "name_zh"
    t.text     "overview_zh"
    t.text     "features_zh"
    t.text     "bonus_zh"
    t.text     "audience_zh"
    t.text     "agenda_introduction_zh"
    t.text     "agenda_zh"
    t.string   "name_en"
    t.text     "overview_en"
    t.text     "features_en"
    t.text     "bonus_en"
    t.text     "audience_en"
    t.text     "agenda_introduction_en"
    t.text     "agenda_en"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name_zh"
    t.string   "location_zh"
    t.text     "description_zh"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "trainer_id"
    t.integer  "status",                :default => 1
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "city_zh"
    t.string   "discount_zh"
    t.string   "name_en"
    t.text     "description_en"
    t.string   "city_en"
    t.string   "location_en"
    t.string   "discount_en"
    t.integer  "course_description_id"
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
    t.string   "title_zh"
    t.text     "body_zh"
    t.string   "abstract_zh"
    t.datetime "posted_on"
    t.string   "category"
    t.string   "ref_link"
    t.string   "status"
    t.string   "keywords"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title_en"
    t.text     "body_en"
    t.string   "abstract_en"
  end

  add_index "news_and_events", ["category"], :name => "index_news_and_events_on_category"
  add_index "news_and_events", ["posted_on"], :name => "index_news_and_events_on_posted_on"
  add_index "news_and_events", ["slug"], :name => "index_news_and_events_on_slug", :unique => true
  add_index "news_and_events", ["status"], :name => "index_news_and_events_on_status"
  add_index "news_and_events", ["title_zh"], :name => "index_news_and_events_on_title"

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
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "name_en"
    t.text     "description_en"
    t.text     "bio_en"
    t.string   "work_as_en"
    t.boolean  "need_assistant", :default => true
    t.boolean  "show_in_team",   :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.boolean  "reviewed",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
