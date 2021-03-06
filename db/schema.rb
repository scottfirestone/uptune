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

ActiveRecord::Schema.define(version: 20160425202206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "playlist_tracks", force: :cascade do |t|
    t.integer  "playlist_id"
    t.integer  "track_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "playlist_tracks", ["playlist_id"], name: "index_playlist_tracks_on_playlist_id", using: :btree
  add_index "playlist_tracks", ["track_id"], name: "index_playlist_tracks_on_track_id", using: :btree

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.string   "playlist_id"
    t.string   "uri"
    t.string   "href"
    t.string   "snapshot_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "code"
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id", using: :btree

  create_table "tracks", force: :cascade do |t|
    t.string   "artist"
    t.string   "title"
    t.string   "uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "image"
    t.string   "token"
    t.string   "refresh_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "token_expiry"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "playlist_track_id"
    t.string   "token"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "votes", ["playlist_track_id"], name: "index_votes_on_playlist_track_id", using: :btree

  add_foreign_key "playlist_tracks", "playlists"
  add_foreign_key "playlist_tracks", "tracks"
  add_foreign_key "playlists", "users"
  add_foreign_key "votes", "playlist_tracks"
end
