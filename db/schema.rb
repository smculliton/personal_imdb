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

ActiveRecord::Schema.define(version: 2022_10_10_214059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.integer "birth_year"
    t.string "birth_place"
    t.boolean "still_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.integer "release_year"
    t.string "mpaa_rating"
    t.integer "run_time"
    t.integer "rotten_tomatoes_score"
    t.boolean "oscar_winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "director_id"
    t.index ["director_id"], name: "index_movies_on_director_id"
  end

  add_foreign_key "movies", "directors"
end
