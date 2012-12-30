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

ActiveRecord::Schema.define(:version => 20121229123103) do

  create_table "events", :force => true do |t|
    t.string   "title_en"
    t.string   "title_lv"
    t.text     "description_lv"
    t.string   "slug_lv"
    t.string   "title_ru"
    t.text     "description_ru"
    t.string   "slug_ru"
    t.integer  "length"
    t.integer  "type_id"
    t.string   "trailer"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
  end

  add_index "events", ["slug_lv"], :name => "index_events_on_slug_lv"
  add_index "events", ["slug_ru"], :name => "index_events_on_slug_ru"

  create_table "places", :force => true do |t|
    t.string   "name_en"
    t.string   "name_lv"
    t.string   "name_ru"
    t.integer  "city_id"
    t.text     "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "showtimes", :force => true do |t|
    t.integer  "event_id"
    t.datetime "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

end
