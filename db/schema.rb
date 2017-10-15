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

ActiveRecord::Schema.define(version: 20171015193928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "subject"
    t.integer "num"
    t.integer "section"
    t.string "title"
    t.integer "id_primary_inst"
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
  end

  create_table "instructors", force: :cascade do |t|
    t.integer "uin"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer "uin"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "level"
    t.string "integer"
    t.string "email"
    t.string "phone"
    t.string "string"
    t.string "assigned"
    t.string "boolean"
    t.string "advisor_email"
    t.string "can_ta"
    t.string "can_grader"
    t.string "can_sgrader"
    t.string "perferences"
    t.string "date_enrolled"
    t.string "date"
    t.string "last_modified"
    t.string "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
