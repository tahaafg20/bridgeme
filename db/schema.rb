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

ActiveRecord::Schema.define(version: 2019_08_27_144729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "calendars", force: :cascade do |t|
    t.date "day"
    t.integer "price"
    t.integer "status"
    t.bigint "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_calendars_on_room_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "number"
    t.string "country"
    t.text "services"
    t.text "about"
    t.boolean "status"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.string "link"
    t.index ["user_id"], name: "index_communities_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.string "email"
    t.text "about"
    t.string "accepted_documents"
    t.text "services"
    t.boolean "status"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.bigint "user_id"
    t.string "link"
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "healths", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.string "link"
    t.string "email"
    t.text "services"
    t.text "about"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "status"
    t.string "accepted_documents"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_healths_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "conversation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "ngos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "number"
    t.float "longitude"
    t.float "latitude"
    t.string "email"
    t.text "services"
    t.text "about"
    t.boolean "status"
    t.string "link"
    t.string "accepted_documents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_ngos_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "message_id"
    t.index ["message_id"], name: "index_notifications_on_message_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "health_id"
    t.bigint "education_id"
    t.bigint "community_id"
    t.bigint "ngo_id"
    t.index ["community_id"], name: "index_posts_on_community_id"
    t.index ["education_id"], name: "index_posts_on_education_id"
    t.index ["health_id"], name: "index_posts_on_health_id"
    t.index ["ngo_id"], name: "index_posts_on_ngo_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "price"
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 1
    t.index ["room_id"], name: "index_reservations_on_room_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "star", default: 1
    t.bigint "room_id"
    t.bigint "reservation_id"
    t.bigint "guest_id"
    t.bigint "host_id"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guest_id"], name: "index_reviews_on_guest_id"
    t.index ["host_id"], name: "index_reviews_on_host_id"
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
    t.index ["room_id"], name: "index_reviews_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_type"
    t.integer "accommodate"
    t.string "listing_name"
    t.text "summary"
    t.string "address"
    t.boolean "is_tv"
    t.boolean "is_kitchen"
    t.boolean "is_air"
    t.boolean "is_heating"
    t.boolean "is_internet"
    t.integer "price"
    t.boolean "active"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "instant", default: 1
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "fullname"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "phone_number"
    t.text "description"
    t.integer "unread", default: 1
    t.string "merchant_id"
    t.string "merchant_provider"
    t.string "merchant_access_code"
    t.string "merchant_publishable_key"
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "calendars", "rooms"
  add_foreign_key "communities", "users"
  add_foreign_key "educations", "users"
  add_foreign_key "healths", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "ngos", "users"
  add_foreign_key "notifications", "messages"
  add_foreign_key "notifications", "users"
  add_foreign_key "posts", "communities"
  add_foreign_key "posts", "educations"
  add_foreign_key "posts", "healths"
  add_foreign_key "posts", "ngos"
  add_foreign_key "posts", "users"
  add_foreign_key "reservations", "rooms"
  add_foreign_key "reservations", "users"
  add_foreign_key "reviews", "reservations"
  add_foreign_key "reviews", "rooms"
  add_foreign_key "reviews", "users", column: "guest_id"
  add_foreign_key "reviews", "users", column: "host_id"
  add_foreign_key "rooms", "users"
end
