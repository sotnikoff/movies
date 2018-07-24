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

ActiveRecord::Schema.define(version: 2018_07_16_111821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actors_movies", force: :cascade do |t|
    t.bigint "actor_id"
    t.bigint "movie_id"
    t.index ["actor_id"], name: "index_actors_movies_on_actor_id"
    t.index ["movie_id"], name: "index_actors_movies_on_movie_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "halls", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seats"
    t.integer "rows"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "rating"
    t.string "image"
    t.bigint "genre_id"
    t.text "description"
    t.string "adult_rating"
    t.bigint "director_id"
    t.bigint "company_id"
    t.integer "movie_length"
    t.date "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_movies_on_company_id"
    t.index ["director_id"], name: "index_movies_on_director_id"
    t.index ["genre_id"], name: "index_movies_on_genre_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "email"
    t.string "phone"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "show_id"
    t.bigint "order_id"
    t.integer "row"
    t.integer "seat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_reservations_on_order_id"
    t.index ["show_id"], name: "index_reservations_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.bigint "hall_id"
    t.bigint "movie_id"
    t.datetime "show_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hall_id"], name: "index_shows_on_hall_id"
    t.index ["movie_id"], name: "index_shows_on_movie_id"
  end

  add_foreign_key "movies", "companies"
  add_foreign_key "movies", "directors"
  add_foreign_key "movies", "genres"
  add_foreign_key "reservations", "orders"
  add_foreign_key "reservations", "shows"
  add_foreign_key "shows", "halls"
  add_foreign_key "shows", "movies"
end
