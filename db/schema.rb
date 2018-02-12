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

ActiveRecord::Schema.define(version: 20180211143410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.text "address"
    t.string "customer_id"
    t.text "additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "family_name"
    t.string "given_names"
    t.bigint "company_id"
    t.string "title"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.text "address"
    t.string "customer_id"
    t.text "additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_contacts_on_company_id"
  end

  create_table "contacts_projects", force: :cascade do |t|
    t.bigint "contact_id"
    t.bigint "project_id"
    t.index ["contact_id"], name: "index_contacts_projects_on_contact_id"
    t.index ["project_id"], name: "index_contacts_projects_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "project_id"
    t.string "description"
    t.integer "status", default: 0
    t.datetime "due_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  add_foreign_key "contacts", "companies"
  add_foreign_key "contacts_projects", "contacts"
  add_foreign_key "contacts_projects", "projects"
  add_foreign_key "tasks", "projects"
end
