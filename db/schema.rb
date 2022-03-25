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

ActiveRecord::Schema[7.0].define(version: 2022_03_25_064250) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "user_id", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "user_id"], name: "index_comments_on_post_id_and_user_id", unique: true
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "post_ratings", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "user_id", null: false
    t.integer "rating", null: false
    t.index ["post_id", "user_id"], name: "index_post_ratings_on_post_id_and_user_id", unique: true
    t.index ["post_id"], name: "index_post_ratings_on_post_id"
    t.index ["user_id"], name: "index_post_ratings_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.citext "name", null: false
    t.integer "category", default: 1, null: false
    t.jsonb "details", default: {}
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_posts_on_category"
    t.index ["name"], name: "index_posts_on_name"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "comment_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_reports_on_comment_id"
  end

  create_table "users", force: :cascade do |t|
    t.citext "name", null: false
    t.citext "username", null: false
    t.citext "email", null: false
    t.string "password", null: false
    t.string "phone", limit: 18, null: false
    t.integer "role", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
