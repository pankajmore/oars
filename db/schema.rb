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

ActiveRecord::Schema.define(:version => 20121105163939) do

  create_table "academic_informations", :force => true do |t|
    t.float    "cpi"
    t.integer  "student_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "course_takens", :force => true do |t|
    t.integer  "credits"
    t.string   "grate"
    t.string   "semester"
    t.string   "year"
    t.integer  "course_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "academic_information_id"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "offered_course_id"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "faculties", :force => true do |t|
    t.string   "pfno"
    t.string   "username"
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "department_id"
  end

  add_index "faculties", ["email"], :name => "index_faculties_on_email", :unique => true
  add_index "faculties", ["reset_password_token"], :name => "index_faculties_on_reset_password_token", :unique => true

  create_table "faculties_offered_courses", :id => false, :force => true do |t|
    t.integer "faculty_id"
    t.integer "offered_course_id"
  end

  create_table "lecture_times", :force => true do |t|
    t.string   "day"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "offered_course_id"
  end

  create_table "offered_courses", :force => true do |t|
    t.string   "description"
    t.text     "accept_requests"
    t.text     "drop_requests"
    t.integer  "credit"
    t.text     "pre_reqs"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "course_id"
    t.integer  "registration_form_id"
  end

  create_table "registration_forms", :force => true do |t|
    t.string   "form_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "student_id"
  end

  create_table "students", :force => true do |t|
    t.string   "roll"
    t.string   "username"
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "department_id"
  end

  add_index "students", ["email"], :name => "index_students_on_email", :unique => true
  add_index "students", ["reset_password_token"], :name => "index_students_on_reset_password_token", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "type"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
