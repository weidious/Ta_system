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

ActiveRecord::Schema.define(version: 20171126002825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applies", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "student_id"
    t.integer "appType"
    t.integer "priority"
    t.boolean "positive"
    t.boolean "acceptAdjust"
    t.boolean "takenBefore"
    t.string "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_applies_on_course_id"
    t.index ["student_id"], name: "index_applies_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "subject"
    t.integer "num"
    t.integer "section"
    t.string "title"
    t.bigint "instructor_id"
    t.integer "num_ta"
    t.integer "num_grader"
    t.integer "num_sgrader"
    t.text "requirement_ta"
    t.text "requirement_grader"
    t.text "requirement_sgrader"
    t.integer "ta_candidate_1"
    t.integer "ta_candidate_2"
    t.integer "ta_candidate_3"
    t.integer "ta_candidate_4"
    t.integer "ta_candidate_5"
    t.integer "grader_candidate_1"
    t.integer "grader_candidate_2"
    t.integer "grader_candidate_3"
    t.integer "grader_candidate_4"
    t.integer "grader_candidate_5"
    t.integer "sgrader_candidate_1"
    t.integer "sgrader_candidate_2"
    t.integer "sgrader_candidate_3"
    t.integer "sgrader_candidate_4"
    t.integer "sgrader_candidate_5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_courses_on_instructor_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.integer "uin"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "netID"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "student_id"
    t.integer "app_type"
    t.boolean "student_accepted"
    t.boolean "instructor_accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.boolean "advisor_accepted"
    t.index ["course_id"], name: "index_offers_on_course_id"
    t.index ["student_id"], name: "index_offers_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "uin"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.integer "level"
    t.string "email"
    t.string "phone"
    t.boolean "assigned"
    t.string "advisor_email"
    t.boolean "can_ta"
    t.boolean "can_grader"
    t.boolean "can_sgrader"
    t.string "perferences"
    t.date "date_enrolled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "netID"
  end

  add_foreign_key "applies", "courses"
  add_foreign_key "applies", "students"
  add_foreign_key "courses", "instructors"
  add_foreign_key "offers", "courses"
  add_foreign_key "offers", "students"
end
