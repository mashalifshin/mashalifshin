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

ActiveRecord::Schema.define(version: 2013_06_10_033037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "post_id"
    t.string "name"
    t.text "comment"
    t.boolean "approved", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "website"
  end

  create_table "infos", id: :serial, force: :cascade do |t|
    t.string "resume"
    t.text "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_images", id: :serial, force: :cascade do |t|
    t.string "image"
    t.integer "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "image_order"
    t.string "name"
    t.date "date"
    t.string "author"
    t.text "info"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "live", default: false
  end

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  create_table "rails_admin_histories", id: :serial, force: :cascade do |t|
    t.text "message"
    t.string "username"
    t.integer "item"
    t.string "table"
    t.integer "month", limit: 2
    t.bigint "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["item", "table", "month", "year"], name: "index_rails_admin_histories"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
