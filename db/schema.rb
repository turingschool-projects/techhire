ActiveRecord::Schema.define(version: 20150424065621) do

  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "organization"
    t.string   "title"
    t.string   "state"
    t.string   "city"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "hiring"
    t.integer  "hire_count"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "pdfs", force: :cascade do |t|
    t.string   "url"
    t.string   "page"
    t.integer  "slot"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "pdf_file_file_name"
    t.string   "pdf_file_content_type"
    t.integer  "pdf_file_file_size"
    t.datetime "pdf_file_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "role",            default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
