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

ActiveRecord::Schema.define(version: 20170210131207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "mac"
    t.boolean  "button"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
  end

  create_table "drafts", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.json     "object"
    t.json     "previous_draft"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["created_at"], name: "index_drafts_on_created_at", using: :btree
    t.index ["event"], name: "index_drafts_on_event", using: :btree
    t.index ["item_id"], name: "index_drafts_on_item_id", using: :btree
    t.index ["item_type"], name: "index_drafts_on_item_type", using: :btree
    t.index ["updated_at"], name: "index_drafts_on_updated_at", using: :btree
    t.index ["whodunnit"], name: "index_drafts_on_whodunnit", using: :btree
  end

  create_table "sketches", force: :cascade do |t|
    t.jsonb    "links",        default: "[]", null: false
    t.jsonb    "boards",       default: "[]", null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "draft_id"
    t.datetime "published_at"
    t.datetime "trashed_at"
  end

end
