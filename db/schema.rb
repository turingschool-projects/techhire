# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150906024344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "organization"
    t.string   "title"
    t.string   "state"
    t.string   "city"
    t.string   "email"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.boolean  "hiring"
    t.string   "status",                        default: "uncontacted"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "hire_count",                    default: 0
    t.string   "zip_code"
    t.string   "organization_type"
    t.text     "techhire_involvement"
    t.boolean  "interest_hiring",               default: false
    t.boolean  "interest_training",             default: false
    t.boolean  "interest_connecting",           default: false
    t.boolean  "interest_supporting",           default: false
    t.boolean  "interest_community",            default: false
    t.string   "sector"
    t.string   "phone"
    t.string   "location"
    t.string   "it_employees"
    t.boolean  "it_category_software",          default: false
    t.boolean  "it_category_frontend",          default: false
    t.boolean  "it_category_backend",           default: false
    t.boolean  "it_category_mobile",            default: false
    t.boolean  "it_category_data",              default: false
    t.boolean  "it_category_biz_intel",         default: false
    t.boolean  "it_category_pm",                default: false
    t.boolean  "it_category_qa",                default: false
    t.boolean  "it_category_sysadmin",          default: false
    t.boolean  "it_category_tech_support",      default: false
    t.boolean  "it_category_writer",            default: false
    t.boolean  "it_category_design",            default: false
    t.boolean  "it_category_is",                default: false
    t.boolean  "it_category_other",             default: false
    t.string   "it_category_other_description"
    t.string   "skills_needed"
    t.string   "job_locations"
    t.string   "it_openings"
    t.string   "languages_needed"
    t.string   "drug_testing"
    t.string   "good_credit"
    t.string   "criminal_record"
    t.string   "casual_dress"
    t.string   "sponsorship"
    t.string   "relocation"
    t.string   "internship"
    t.boolean  "participate_akron",             default: false
    t.boolean  "participate_louisville",        default: false
    t.boolean  "participate_philadelphia",      default: false
    t.boolean  "participate_albuquerque",       default: false
    t.boolean  "participate_lynchburg",         default: false
    t.boolean  "participate_pittsburgh",        default: false
    t.boolean  "participate_birmingham",        default: false
    t.boolean  "participate_me",                default: false
    t.boolean  "participate_portland",          default: false
    t.boolean  "participate_chattanooga",       default: false
    t.boolean  "participate_memphis",           default: false
    t.boolean  "participate_ri",                default: false
    t.boolean  "participate_cincinnati",        default: false
    t.boolean  "participate_minneapolis",       default: false
    t.boolean  "participate_rochester",         default: false
    t.boolean  "participate_co",                default: false
    t.boolean  "participate_nashville",         default: false
    t.boolean  "participate_saltlakecity",      default: false
    t.boolean  "participate_de",                default: false
    t.boolean  "participate_kearney",           default: false
    t.boolean  "participate_sanantonio",        default: false
    t.boolean  "participate_detroit",           default: false
    t.boolean  "participate_sanfrancisco",      default: false
    t.boolean  "participate_eastky",            default: false
    t.boolean  "participate_neworleans",        default: false
    t.boolean  "participate_sanjose",           default: false
    t.boolean  "participate_kansascity",        default: false
    t.boolean  "participate_newyork",           default: false
    t.boolean  "participate_stlouis",           default: false
    t.boolean  "participate_losangeles",        default: false
    t.boolean  "participate_oakland",           default: false
    t.boolean  "participate_other",             default: false
    t.string   "participate_other_description"
    t.string   "commit_internship_description"
    t.string   "commit_fulltime_description"
    t.string   "commit_written"
    t.string   "commit_phone"
    t.string   "commit_metrics"
    t.string   "commit_other"
    t.string   "commit_other_description"
    t.string   "signature"
    t.string   "plan_talent"
    t.string   "plan_posting"
    t.string   "plan_champion"
    t.string   "plan_business"
    t.string   "plan_metrics"
    t.string   "plan_other"
    t.string   "plan_other_description"
    t.string   "source_language"
    t.string   "source_relationships"
    t.string   "source_hiring"
    t.string   "source_other"
    t.string   "source_other_description"
    t.string   "attract_connect"
    t.string   "attract_leverage"
    t.string   "attract_customize"
    t.string   "attract_other"
    t.string   "attract_other_description"
    t.string   "evaluate_behavior"
    t.string   "evaluate_screening"
    t.string   "evaluate_other"
    t.string   "evaluate_other_description"
    t.string   "retain_onboard"
    t.string   "retain_mentor"
    t.string   "retain_manage"
    t.string   "retain_track"
    t.string   "retain_other"
    t.string   "retain_other_description"
  end

  create_table "contents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "page_id"
    t.integer  "location"
    t.string   "body"
    t.string   "name"
  end

  create_table "notes", force: :cascade do |t|
    t.string   "body"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["company_id"], name: "index_notes_on_company_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.integer  "number_of_locations"
    t.text     "template"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "navigation",          default: false
  end

  create_table "pdfs", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "pdf_file_file_name"
    t.string   "pdf_file_content_type"
    t.integer  "pdf_file_file_size"
    t.datetime "pdf_file_updated_at"
    t.integer  "content_id"
  end

  create_table "states", force: :cascade do |t|
    t.string   "abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usa_cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "usa_cities", ["state_id"], name: "index_usa_cities_on_state_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role",                   default: 0
    t.string   "name"
    t.string   "title"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "notes", "companies"
end
