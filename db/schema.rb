# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_30_114454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_comments_on_course_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.string "credit_number"
    t.text "content"
    t.string "upload_file"
    t.string "course_price"
    t.string "status"
    t.string "marks"
    t.string "attemption"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "file"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "credits", force: :cascade do |t|
    t.string "name"
    t.string "upload_file"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "video"
    t.text "discription"
    t.index ["course_id"], name: "index_credits_on_course_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.index ["course_id"], name: "index_favorites_on_course_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "mc_questions", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.string "distractor_1"
    t.string "distractor_2"
    t.string "distractor_3"
    t.bigint "quiz_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_mc_questions_on_quiz_id"
  end

  create_table "payments", force: :cascade do |t|
    t.float "amount"
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_payments_on_course_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.text "image"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_quizzes_on_course_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "comment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_requests_on_course_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "names"
    t.string "gender"
    t.string "phone"
    t.string "district"
    t.string "reguratory_body"
    t.string "level"
    t.string "user_role", default: "professional"
    t.string "apload_diploma"
    t.string "apload_cv"
    t.string "working_place"
    t.string "uid", default: "", null: false
    t.string "provider", default: "", null: false
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "courses"
  add_foreign_key "comments", "users"
  add_foreign_key "courses", "users"
  add_foreign_key "credits", "courses"
  add_foreign_key "favorites", "courses"
  add_foreign_key "favorites", "users"
  add_foreign_key "mc_questions", "quizzes"
  add_foreign_key "payments", "courses"
  add_foreign_key "payments", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "quizzes", "courses"
  add_foreign_key "replies", "comments"
  add_foreign_key "replies", "users"
  add_foreign_key "requests", "courses"
  add_foreign_key "requests", "users"
end
