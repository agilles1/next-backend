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

ActiveRecord::Schema.define(version: 2021_05_19_221349) do

  create_table "auditions", force: :cascade do |t|
    t.datetime "date"
    t.string "instrument"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "candidate_rooms", force: :cascade do |t|
    t.integer "room_id"
    t.integer "candidate_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_candidate_rooms_on_candidate_id"
    t.index ["room_id"], name: "index_candidate_rooms_on_room_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "number"
    t.integer "audition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["audition_id"], name: "index_candidates_on_audition_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "fill_order"
    t.string "name"
    t.integer "audition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "holding", default: false
    t.index ["audition_id"], name: "index_rooms_on_audition_id"
  end

end
