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

ActiveRecord::Schema[8.0].define(version: 2025_02_12_150103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "draws", force: :cascade do |t|
    t.string "title"
    t.string "key"
    t.string "draw"
    t.integer "length"
    t.datetime "last_result_seen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "last_serie"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "state"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "raffles", force: :cascade do |t|
    t.date "award_date"
    t.string "status"
    t.string "award"
    t.integer "winner"
    t.bigint "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_raffles_on_place_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "number"
    t.string "sign"
    t.string "hour"
    t.bigint "draw_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "serie"
    t.index ["draw_id"], name: "index_results_on_draw_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "hour"
    t.bigint "draw_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["draw_id"], name: "index_schedules_on_draw_id"
  end

  add_foreign_key "raffles", "places"
  add_foreign_key "results", "draws"
  add_foreign_key "schedules", "draws"
end
