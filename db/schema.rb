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

ActiveRecord::Schema.define(version: 20141201212150) do

  create_table "feedbacks", force: true do |t|
    t.integer  "question_id"
    t.integer  "performance_review_id"
    t.text     "comment"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedbacks", ["question_id", "performance_review_id"], name: "index_feedbacks_on_question_id_and_performance_review_id", using: :btree

  create_table "navigations", force: true do |t|
    t.string   "title",      limit: 50
    t.integer  "position"
    t.string   "permalink"
    t.boolean  "admin",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "performance_reviews", force: true do |t|
    t.integer  "reviewer_id"
    t.integer  "reviewee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "performance_reviews", ["reviewee_id"], name: "index_performance_reviews_on_reviewee_id", using: :btree
  add_index "performance_reviews", ["reviewer_id"], name: "index_performance_reviews_on_reviewer_id", using: :btree

  create_table "questionnaires", force: true do |t|
    t.string   "title"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questionnaires", ["admin_id"], name: "index_questionnaires_on_admin_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "description"
    t.string   "title"
    t.integer  "max_rate"
    t.integer  "questionnaire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["questionnaire_id"], name: "index_questions_on_questionnaire_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",      limit: 50
    t.string   "last_name",       limit: 100
    t.string   "email"
    t.text     "description"
    t.string   "password_digest"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
