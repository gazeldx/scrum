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

ActiveRecord::Schema.define(:version => 20130327064217) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "trainer_id"
    t.integer  "status",      :default => 1
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "city"
    t.string   "discount"
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

  create_table "students", :force => true do |t|
    t.string   "title"
    t.string   "train_type"
    t.integer  "trainer_id"
    t.string   "trainer_type"
    t.string   "avatar"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "trainers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "email"
    t.string   "url"
    t.string   "phone"
    t.string   "avatar"
    t.text     "bio"
    t.string   "base"
    t.string   "work_as"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
