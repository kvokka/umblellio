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

ActiveRecord::Schema.define(version: 20160209003006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogposts", force: :cascade do |t|
    t.string   "subj"
    t.text     "content"
    t.inet     "autor_ip"
    t.integer  "user_id"
    t.integer  "rate_sum",   default: 0
    t.integer  "rate_count", default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "blogposts", ["autor_ip"], name: "index_blogposts_on_autor_ip", using: :btree
  add_index "blogposts", ["rate_count"], name: "index_blogposts_on_rate_count", using: :btree
  add_index "blogposts", ["rate_sum"], name: "index_blogposts_on_rate_sum", using: :btree
  add_index "blogposts", ["user_id"], name: "index_blogposts_on_user_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "rating",      limit: 2
    t.integer  "blogpost_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "rates", ["blogpost_id"], name: "index_rates_on_blogpost_id", using: :btree
  add_index "rates", ["rating"], name: "index_rates_on_rating", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blogposts", "users"
  add_foreign_key "rates", "blogposts"
end
