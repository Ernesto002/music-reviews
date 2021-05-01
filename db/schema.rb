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

ActiveRecord::Schema.define(version: 2021_05_01_064110) do

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.integer "medium_id"
    t.integer "artist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_albums_on_artist_id"
    t.index ["medium_id"], name: "index_albums_on_medium_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.integer "medium_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medium_id"], name: "index_artists_on_medium_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "medium_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medium_id"], name: "index_favorites_on_medium_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.integer "medium_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medium_id"], name: "index_genres_on_medium_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "medium_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.string "rating"
    t.integer "user_id", null: false
    t.integer "medium_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medium_id"], name: "index_reviews_on_medium_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.integer "medium_id"
    t.integer "album_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
    t.index ["medium_id"], name: "index_songs_on_medium_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "uid_twitter"
    t.integer "uid_facebook"
    t.integer "uid_google_oauth2"
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "albums", "media"
  add_foreign_key "artists", "media"
  add_foreign_key "favorites", "media"
  add_foreign_key "favorites", "users"
  add_foreign_key "genres", "media"
  add_foreign_key "reviews", "media"
  add_foreign_key "reviews", "users"
  add_foreign_key "songs", "albums"
  add_foreign_key "songs", "media"
end
