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

ActiveRecord::Schema[7.0].define(version: 2023_08_08_221152) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "track_type", ["regular", "bonus"]
  create_enum "type", ["live", "studio"]

  create_table "albums", force: :cascade do |t|
    t.bigint "band_id", null: false
    t.string "title", null: false
    t.datetime "year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.enum "type", default: "studio", null: false, enum_type: "type"
    t.index ["band_id"], name: "index_albums_on_band_id"
    t.index ["title", "band_id"], name: "index_albums_on_title_and_band_id", unique: true
  end

  create_table "bands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_bands_on_name", unique: true
  end

  create_table "tracks", force: :cascade do |t|
    t.bigint "album_id", null: false
    t.string "title", null: false
    t.integer "ord", null: false
    t.string "lyrics"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.enum "track_type", default: "regular", null: false, enum_type: "track_type"
    t.index ["album_id"], name: "index_tracks_on_album_id"
    t.index ["ord", "album_id"], name: "index_tracks_on_ord_and_album_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

  add_foreign_key "albums", "bands"
  add_foreign_key "tracks", "albums"
end
