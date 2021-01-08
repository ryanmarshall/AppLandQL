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

ActiveRecord::Schema.define(version: 2021_01_08_015149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.bigint "client_id"
    t.string "name", null: false
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "auth_provider"
    t.index ["client_id"], name: "index_apps_on_client_id"
    t.index ["name"], name: "index_apps_on_name"
  end

  create_table "class_maps", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "app_id"
    t.integer "parent_id"
    t.string "name"
    t.string "type_name"
    t.string "location"
    t.boolean "static"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["app_id"], name: "index_class_maps_on_app_id"
    t.index ["client_id"], name: "index_class_maps_on_client_id"
    t.index ["name"], name: "index_class_maps_on_name"
    t.index ["parent_id"], name: "index_class_maps_on_parent_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "app_id"
    t.integer "parser"
    t.integer "event_id"
    t.string "event"
    t.integer "thread_id"
    t.string "defined_class"
    t.string "searchable"
    t.string "path"
    t.json "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["app_id"], name: "index_events_on_app_id"
    t.index ["client_id"], name: "index_events_on_client_id"
    t.index ["defined_class"], name: "index_events_on_defined_class"
    t.index ["parser"], name: "index_events_on_parser"
    t.index ["searchable"], name: "index_events_on_searchable"
  end

end
