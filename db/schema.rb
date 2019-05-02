# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_02_125823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_relationships", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "accepted", default: true
    t.index ["followed_id"], name: "index_account_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_account_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_account_relationships_on_follower_id"
  end

  create_table "account_settings", force: :cascade do |t|
    t.boolean "private_profile", default: false
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_settings_on_account_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "conversation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "read_at"
    t.bigint "account_id"
    t.text "encrypted_body", null: false
    t.string "encrypted_body_iv"
    t.index ["account_id"], name: "index_messages_on_account_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["encrypted_body_iv"], name: "index_messages_on_encrypted_body_iv", unique: true
  end

  create_table "post_likes", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_post_likes_on_account_id"
    t.index ["post_id", "account_id"], name: "index_post_likes_on_post_id_and_account_id", unique: true
    t.index ["post_id"], name: "index_post_likes_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id"
    t.boolean "private", default: false
    t.index ["account_id"], name: "index_posts_on_account_id"
  end

  add_foreign_key "account_settings", "accounts"
  add_foreign_key "messages", "accounts"
  add_foreign_key "messages", "conversations"
  add_foreign_key "post_likes", "accounts"
  add_foreign_key "post_likes", "posts"
  add_foreign_key "posts", "accounts"
end
