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

ActiveRecord::Schema[7.0].define(version: 2022_05_20_062717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "body", null: false
    t.bigint "video_id", null: false
    t.bigint "commenter_id", null: false
    t.bigint "parent_comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commenter_id"], name: "index_comments_on_commenter_id"
    t.index ["parent_comment_id"], name: "index_comments_on_parent_comment_id"
    t.index ["video_id"], name: "index_comments_on_video_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "liker_id", null: false
    t.bigint "video_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["liker_id"], name: "index_likes_on_liker_id"
    t.index ["video_id", "liker_id"], name: "index_likes_on_video_id_and_liker_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.bigint "uploader_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uploader_id"], name: "index_videos_on_uploader_id"
  end

  add_foreign_key "comments", "comments", column: "parent_comment_id"
  add_foreign_key "comments", "users", column: "commenter_id"
  add_foreign_key "comments", "videos"
  add_foreign_key "likes", "users", column: "liker_id"
  add_foreign_key "likes", "videos"
  add_foreign_key "videos", "users", column: "uploader_id"
end