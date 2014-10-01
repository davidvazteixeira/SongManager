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

ActiveRecord::Schema.define(version: 20141001000633) do

  create_table "song_histories", force: true do |t|
    t.string   "proto_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "song_versions", force: true do |t|
    t.integer  "song_history_id"
    t.string   "name"
    t.string   "song"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_histories", force: true do |t|
    t.integer "user_id"
    t.integer "song_history_id"
  end

  add_index "user_histories", ["song_history_id"], name: "index_user_histories_on_song_history_id"
  add_index "user_histories", ["user_id"], name: "index_user_histories_on_user_id"

  create_table "users", force: true do |t|
    t.string "name"
  end

end
