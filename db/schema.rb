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

ActiveRecord::Schema[8.0].define(version: 2025_09_30_003638) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bilheteria_events", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "event_date", null: false
    t.string "venue", null: false
    t.integer "max_capacity", default: 0, null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.boolean "active", default: true
    t.string "status", default: "draft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_bilheteria_events_on_active"
    t.index ["event_date"], name: "index_bilheteria_events_on_event_date"
    t.index ["status"], name: "index_bilheteria_events_on_status"
  end

  create_table "bilheteria_tickets", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.string "customer_name", null: false
    t.string "customer_email", null: false
    t.string "seat_number"
    t.string "status", default: "pending"
    t.datetime "purchase_date", null: false
    t.decimal "price_paid", precision: 10, scale: 2, null: false
    t.string "ticket_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_email"], name: "index_bilheteria_tickets_on_customer_email"
    t.index ["event_id"], name: "index_bilheteria_tickets_on_event_id"
    t.index ["status"], name: "index_bilheteria_tickets_on_status"
    t.index ["ticket_code"], name: "index_bilheteria_tickets_on_ticket_code", unique: true
  end

  create_table "ticketing_events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "venue"
    t.date "start_on"
    t.date "end_on"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticketing_tickets", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "used_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code", null: false
    t.integer "ticket_type"
    t.integer "price_cents"
    t.index ["code"], name: "index_ticketing_tickets_on_code", unique: true
    t.index ["event_id"], name: "index_ticketing_tickets_on_event_id"
    t.index ["status"], name: "index_ticketing_tickets_on_status"
  end

  add_foreign_key "bilheteria_tickets", "bilheteria_events", column: "event_id"
  add_foreign_key "ticketing_tickets", "ticketing_events", column: "event_id"
end
