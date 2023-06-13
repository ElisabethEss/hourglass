# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_12_160734) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "avatars", force: :cascade do |t|
    t.integer "level"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "total_study_time"
    t.integer "total_break_time"
    t.integer "experience"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "current_session_time"
    t.string "session_type"
    t.integer "duration"
    t.datetime "start_time"
    t.string "task"
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_sessions_on_profile_id"
  end

  create_table "user_achievements", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "achievement_id"
    t.index ["achievement_id"], name: "index_user_achievements_on_achievement_id"
    t.index ["profile_id"], name: "index_user_achievements_on_profile_id"
  end

  create_table "user_avatars", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "avatar_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_user_avatars_on_avatar_id"
    t.index ["profile_id"], name: "index_user_avatars_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "profiles", "users"
  add_foreign_key "sessions", "profiles"
  add_foreign_key "user_achievements", "achievements"
  add_foreign_key "user_achievements", "profiles"
  add_foreign_key "user_avatars", "avatars"
  add_foreign_key "user_avatars", "profiles"
end