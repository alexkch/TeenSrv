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

ActiveRecord::Schema.define(version: 20171008210901) do

  create_table "addresses", force: :cascade do |t|
    t.integer "street_no"
    t.text "street"
    t.integer "apt_no"
    t.string "postalcode"
    t.string "city"
    t.string "province"
    t.integer "address_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "bank_infos", force: :cascade do |t|
    t.integer "payment_id"
    t.string "bank_name"
    t.string "account_type"
    t.string "account_name"
    t.integer "account_number"
    t.integer "transit_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_bank_infos_on_payment_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.integer "payment_id"
    t.string "card_type"
    t.string "card_name"
    t.integer "card_number"
    t.integer "cvc"
    t.integer "card_expiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_credit_cards_on_payment_id"
  end

  create_table "endorsements", force: :cascade do |t|
    t.integer "endorsed_user_id"
    t.integer "reference_user_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["endorsed_user_id"], name: "index_endorsements_on_endorsed_user_id"
    t.index ["reference_user_id"], name: "index_endorsements_on_reference_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.datetime "dob"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "usertype"
  end

end
