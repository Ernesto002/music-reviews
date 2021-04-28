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

ActiveRecord::Schema.define(version: 2021_04_25_035333) do

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.integer "music_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["music_id"], name: "index_albums_on_music_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.integer "music_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["music_id"], name: "index_artists_on_music_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.integer "music_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["music_id"], name: "index_genres_on_music_id"
  end

  create_table "music", force: :cascade do |t|
    t.string "music_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.integer "music_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["music_id"], name: "index_songs_on_music_id"
  end

  add_foreign_key "albums", "musics"
  add_foreign_key "artists", "musics"
  add_foreign_key "genres", "musics"
  add_foreign_key "songs", "musics"
end
