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

ActiveRecord::Schema.define(version: 20141130010341) do

  create_table "admins", force: true do |t|
    t.string   "first_name",      limit: 30
    t.string   "last_name",       limit: 40
    t.string   "email",                      default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "authorship", id: false, force: true do |t|
    t.integer "performance_review_id"
    t.integer "user_id"
  end

  add_index "authorship", ["user_id", "performance_review_id"], name: "index_authorship_on_user_id_and_performance_review_id", using: :btree

  create_table "feedbacks", force: true do |t|
    t.integer  "question_id"
    t.integer  "performance_review_id"
    t.text     "comment"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedbacks", ["question_id", "performance_review_id"], name: "index_feedbacks_on_question_id_and_performance_review_id", using: :btree

  create_table "globals", force: true do |t|
    t.boolean  "admin",                    default: false
    t.integer  "total_number_of_question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "navigations", force: true do |t|
    t.string   "title",       limit: 25
    t.integer  "position"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "nav_enabled"
  end

  create_table "performance_reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "number_of_questions"
    t.integer  "commented"
    t.integer  "overall_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
  end

  add_index "performance_reviews", ["author_id"], name: "index_performance_reviews_on_author_id", using: :btree
  add_index "performance_reviews", ["user_id"], name: "index_performance_reviews_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "question"
    t.integer  "position"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_rate",   default: 10
  end

  create_table "users", force: true do |t|
    t.string   "first_name", limit: 30
    t.string   "last_name",  limit: 40
    t.string   "email",                 default: ""
    t.boolean  "completed",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
