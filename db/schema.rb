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

ActiveRecord::Schema.define(:version => 20131022012936) do

  create_table "answers", :force => true do |t|
    t.text    "conteudo"
    t.integer "votos"
    t.integer "question_id"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "punches", :force => true do |t|
    t.integer  "punchable_id",                                :null => false
    t.string   "punchable_type", :limit => 20,                :null => false
    t.datetime "starts_at",                                   :null => false
    t.datetime "ends_at",                                     :null => false
    t.datetime "average_time",                                :null => false
    t.integer  "hits",                         :default => 1, :null => false
  end

  add_index "punches", ["average_time"], :name => "index_punches_on_average_time"
  add_index "punches", ["punchable_type", "punchable_id"], :name => "punchable_index"

  create_table "questions", :force => true do |t|
    t.string   "titulo"
    t.text     "conteudo"
    t.integer  "votos"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "tags"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
