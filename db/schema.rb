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

ActiveRecord::Schema.define(version: 20180923035514) do

  create_table "addresses", force: :cascade do |t|
    t.string   "recipient",                        null: false
    t.string   "line_1",                           null: false
    t.string   "line_2"
    t.string   "city",                             null: false
    t.string   "state",                            null: false
    t.string   "zip",                              null: false
    t.string   "country",      default: "USA",     null: false
    t.string   "category",     default: "primary", null: false
    t.integer  "household_id"
    t.datetime "verified_at"
    t.text     "notes"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.datetime "deleted_at"
    t.index ["category"], name: "index_addresses_on_category"
    t.index ["deleted_at"], name: "index_addresses_on_deleted_at"
    t.index ["household_id"], name: "index_addresses_on_household_id"
    t.index ["recipient"], name: "index_addresses_on_recipient"
    t.index ["verified_at"], name: "index_addresses_on_verified_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first",        null: false
    t.string   "last"
    t.string   "middle"
    t.integer  "household_id"
    t.string   "phone"
    t.string   "email"
    t.text     "notes"
    t.datetime "birthday"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "deleted_at"
    t.index ["birthday"], name: "index_contacts_on_birthday"
    t.index ["deleted_at"], name: "index_contacts_on_deleted_at"
    t.index ["email"], name: "index_contacts_on_email"
    t.index ["first"], name: "index_contacts_on_first"
    t.index ["household_id"], name: "index_contacts_on_household_id"
    t.index ["last"], name: "index_contacts_on_last"
    t.index ["phone"], name: "index_contacts_on_phone"
  end

  create_table "contacts_labels", id: false, force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "label_id",   null: false
    t.index ["contact_id", "label_id"], name: "index_contacts_labels_on_contact_id_and_label_id"
  end

  create_table "contacts_lists", id: false, force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "list_id",    null: false
    t.index ["contact_id", "list_id"], name: "index_contacts_lists_on_contact_id_and_list_id"
  end

  create_table "correspondences", force: :cascade do |t|
    t.integer  "from_id",                                                null: false
    t.string   "from_type",                                              null: false
    t.integer  "to_id",                                                  null: false
    t.string   "to_type",                                                null: false
    t.string   "category",                                               null: false
    t.string   "occasion"
    t.string   "status",                             default: "initial", null: false
    t.integer  "list_id"
    t.decimal  "cost",       precision: 8, scale: 2
    t.text     "notes"
    t.datetime "deleted_at"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.index ["category"], name: "index_correspondences_on_category"
    t.index ["deleted_at"], name: "index_correspondences_on_deleted_at"
    t.index ["from_id", "from_type"], name: "index_correspondences_on_from_id_and_from_type"
    t.index ["list_id"], name: "index_correspondences_on_list_id"
    t.index ["occasion"], name: "index_correspondences_on_occasion"
    t.index ["status"], name: "index_correspondences_on_status"
    t.index ["to_id", "to_type"], name: "index_correspondences_on_to_id_and_to_type"
  end

  create_table "correspondences_labels", id: false, force: :cascade do |t|
    t.integer "correspondence_id", null: false
    t.integer "label_id",          null: false
    t.index ["correspondence_id", "label_id"], name: "index_correspondences_labels_on_correspondence_id_and_label_id"
  end

  create_table "households", force: :cascade do |t|
    t.string   "name",                                null: false
    t.text     "notes"
    t.datetime "anniversary"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "deleted_at"
    t.string   "description"
    t.integer  "address_stability_score", default: 0, null: false
    t.index ["deleted_at"], name: "index_households_on_deleted_at"
    t.index ["name"], name: "index_households_on_name"
  end

  create_table "labels", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_labels_on_deleted_at"
    t.index ["name"], name: "index_labels_on_name"
  end

  create_table "lists", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_lists_on_deleted_at"
    t.index ["name"], name: "index_lists_on_name"
  end

end
