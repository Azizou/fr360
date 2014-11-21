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

ActiveRecord::Schema.define(version: 20141120162918) do

  create_table "admins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.integer  "user_id"
    t.integer  "performance_review_id"
    t.string   "comment"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedbacks", ["user_id", "performance_review_id"], name: "index_feedbacks_on_user_id_and_performance_review_id", using: :btree

  create_table "performance_reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "number_of_questions"
    t.integer  "commented"
    t.integer  "overall_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "performance_reviews", ["user_id"], name: "index_performance_reviews_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "question"
    t.integer  "position"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name", limit: 30
    t.string   "last_name",  limit: 40
    t.string   "email",                 default: ""
    t.boolean  "completed",             default: false
    t.string   "type",                  default: "team_member"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
