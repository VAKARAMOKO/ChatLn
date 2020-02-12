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

ActiveRecord::Schema.define(version: 2020_02_12_111405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "level_id"
    t.bigint "course_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "matiere_id"
    t.bigint "user_id"
    t.bigint "level_id"
    t.index ["level_id"], name: "index_courses_on_level_id"
    t.index ["matiere_id"], name: "index_courses_on_matiere_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "course_id"
    t.bigint "matiere_id"
    t.index ["course_id"], name: "index_levels_on_course_id"
    t.index ["matiere_id"], name: "index_levels_on_matiere_id"
    t.index ["user_id"], name: "index_levels_on_user_id"
  end

  create_table "matieres", force: :cascade do |t|
    t.string "matiere"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_matieres_on_course_id"
    t.index ["user_id"], name: "index_matieres_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "contact"
    t.string "city"
    t.string "school_name"
    t.string "status"
    t.string "resume"
    t.string "gender"
    t.string "matricule"
    t.string "matiere_shared"
    t.bigint "classroom_id"
    t.bigint "level_id"
    t.string "avatar"
    t.string "slug"
    t.boolean "terms"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "users"
  add_foreign_key "courses", "levels"
  add_foreign_key "courses", "matieres"
  add_foreign_key "courses", "users"
  add_foreign_key "levels", "courses"
  add_foreign_key "levels", "matieres"
  add_foreign_key "levels", "users"
  add_foreign_key "matieres", "courses"
  add_foreign_key "matieres", "users"
end
