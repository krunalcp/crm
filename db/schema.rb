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

ActiveRecord::Schema.define(version: 20160822110528) do

  create_table "imports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "upload_file_name"
    t.integer  "number_of_success"
    t.integer  "number_of_failed"
    t.integer  "total_record"
    t.text     "failure_reason",    limit: 65535
    t.string   "status",            limit: 1
    t.boolean  "disabled",                        default: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["disabled"], name: "index_imports_on_disabled", using: :btree
    t.index ["number_of_failed"], name: "index_imports_on_number_of_failed", using: :btree
    t.index ["number_of_success"], name: "index_imports_on_number_of_success", using: :btree
    t.index ["total_record"], name: "index_imports_on_total_record", using: :btree
    t.index ["user_id"], name: "index_imports_on_user_id", using: :btree
  end

  create_table "person_emails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",      limit: 62
    t.string   "email_type"
    t.integer  "person_id"
    t.boolean  "disabled",              default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["disabled"], name: "index_person_emails_on_disabled", using: :btree
    t.index ["email"], name: "index_person_emails_on_email", using: :btree
    t.index ["person_id"], name: "index_person_emails_on_person_id", using: :btree
  end

  create_table "person_phones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "phone",      limit: 32
    t.string   "phone_type"
    t.integer  "person_id"
    t.boolean  "disabled",              default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["disabled"], name: "index_person_phones_on_disabled", using: :btree
    t.index ["person_id"], name: "index_person_phones_on_person_id", using: :btree
    t.index ["phone"], name: "index_person_phones_on_phone", using: :btree
  end

  create_table "person_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tag_name",   limit: 16
    t.string   "tag_type",   limit: 16
    t.integer  "person_id"
    t.boolean  "disabled",              default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["disabled"], name: "index_person_tags_on_disabled", using: :btree
    t.index ["person_id"], name: "index_person_tags_on_person_id", using: :btree
    t.index ["tag_name"], name: "index_person_tags_on_tag_name", using: :btree
    t.index ["tag_type"], name: "index_person_tags_on_tag_type", using: :btree
  end

  create_table "persons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "prefix_name", limit: 8
    t.string   "first_name",  limit: 64
    t.string   "middle_name", limit: 1
    t.string   "last_name",   limit: 64
    t.string   "suffix_name", limit: 8
    t.integer  "user_id"
    t.text     "address1",    limit: 65535
    t.text     "address2",    limit: 65535
    t.string   "city",        limit: 64
    t.string   "state",       limit: 2
    t.string   "zip1",        limit: 4
    t.string   "zip2",        limit: 5
    t.string   "gender",      limit: 1
    t.integer  "unsubscribe", limit: 1
    t.boolean  "disabled",                  default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["disabled"], name: "index_persons_on_disabled", using: :btree
    t.index ["first_name"], name: "index_persons_on_first_name", using: :btree
    t.index ["user_id"], name: "index_persons_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",             limit: 100
    t.string   "last_name",              limit: 100
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "mobile_number",          limit: 32
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
