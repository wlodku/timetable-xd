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

ActiveRecord::Schema.define(version: 20170321123351) do

  create_table "cards", force: :cascade do |t|
    t.integer  "day"
    t.integer  "period"
    t.integer  "classroom_id"
    t.integer  "lesson_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "cards", ["classroom_id"], name: "index_cards_on_classroom_id"
  add_index "cards", ["lesson_id"], name: "index_cards_on_lesson_id"

  create_table "classrooms", force: :cascade do |t|
    t.string   "short"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "divisiontag"
    t.integer  "squad_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "groups", ["squad_id"], name: "index_groups_on_squad_id"

  create_table "lesson_squads", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "squad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lesson_squads", ["lesson_id"], name: "index_lesson_squads_on_lesson_id"
  add_index "lesson_squads", ["squad_id"], name: "index_lesson_squads_on_squad_id"

  create_table "lessons", force: :cascade do |t|
    t.integer  "periodspercard"
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.integer  "group_id"
    t.integer  "squad_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "classroomids"
  end

  add_index "lessons", ["group_id"], name: "index_lessons_on_group_id"
  add_index "lessons", ["squad_id"], name: "index_lessons_on_squad_id"
  add_index "lessons", ["subject_id"], name: "index_lessons_on_subject_id"
  add_index "lessons", ["teacher_id"], name: "index_lessons_on_teacher_id"

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true

  create_table "squads", force: :cascade do |t|
    t.string   "short"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "squads", ["teacher_id"], name: "index_squads_on_teacher_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "short"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "short"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
