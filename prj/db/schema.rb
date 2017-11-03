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

ActiveRecord::Schema.define(version: 20171103012812) do

  create_table "accepted_jobs", force: :cascade do |t|
    t.integer "job_id"
    t.integer "teenager_id"
    t.integer "trans_id"
    t.datetime "accept_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_accepted_jobs_on_job_id"
    t.index ["teenager_id"], name: "index_accepted_jobs_on_teenager_id"
    t.index ["trans_id"], name: "index_accepted_jobs_on_trans_id"
  end

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

  create_table "apply_jobs", force: :cascade do |t|
    t.integer "job_id"
    t.integer "client_id"
    t.integer "teenager_id"
    t.boolean "filled"
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bank_infos", force: :cascade do |t|
    t.string "account_name"
    t.integer "account_number"
    t.integer "transit_number"
    t.integer "institution_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cancelled_jobs", force: :cascade do |t|
    t.integer "job_id"
    t.integer "teenager_id"
    t.datetime "cancel_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_cancelled_jobs_on_job_id"
    t.index ["teenager_id"], name: "index_cancelled_jobs_on_teenager_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "job_wanted"
    t.integer "user_id"
    t.string "fName"
    t.string "lName"
    t.string "gender"
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_day"
    t.string "address"
    t.integer "apt_no"
    t.string "city"
    t.string "province"
    t.string "country"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "card_type"
    t.string "card_name"
    t.integer "card_number"
    t.integer "cvc"
    t.integer "card_expiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "declined_jobs", force: :cascade do |t|
    t.integer "job_id"
    t.integer "teenager_id"
    t.datetime "decline_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_declined_jobs_on_job_id"
    t.index ["teenager_id"], name: "index_declined_jobs_on_teenager_id"
  end

  create_table "endorsements", force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ref_user_id"
    t.integer "end_user_id"
    t.index ["end_user_id"], name: "index_endorsements_on_end_user_id"
    t.index ["ref_user_id"], name: "index_endorsements_on_ref_user_id"
  end

  create_table "finished_jobs", force: :cascade do |t|
    t.integer "job_id"
    t.integer "teenager_id"
    t.integer "client_id"
    t.integer "trans_id"
    t.datetime "finish_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_finished_jobs_on_client_id"
    t.index ["job_id"], name: "index_finished_jobs_on_job_id"
    t.index ["teenager_id"], name: "index_finished_jobs_on_teenager_id"
    t.index ["trans_id"], name: "index_finished_jobs_on_trans_id"
  end

  create_table "job_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "job_type_id"
    t.integer "teenager_id"
    t.integer "client_id"
    t.integer "amount"
    t.integer "hours"
    t.datetime "starttime"
    t.datetime "finishtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trans_id"
    t.string "name"
    t.boolean "accepted", default: false
    t.string "description"
    t.boolean "cancelled", default: false
    t.index ["client_id"], name: "index_jobs_on_client_id"
    t.index ["job_type_id"], name: "index_jobs_on_job_type_id"
    t.index ["teenager_id"], name: "index_jobs_on_teenager_id"
    t.index ["trans_id"], name: "index_jobs_on_trans_id"
  end

  create_table "offered_jobs", force: :cascade do |t|
    t.integer "job_id"
    t.integer "job_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "teenager_id"
    t.index ["job_id"], name: "index_offered_jobs_on_job_id"
    t.index ["job_type_id"], name: "index_offered_jobs_on_job_type_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "paymenttype"
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

  create_table "ratings", force: :cascade do |t|
    t.integer "job_id"
    t.integer "ref_user_id"
    t.integer "end_user_id"
    t.integer "rating"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_user_id"], name: "index_ratings_on_end_user_id"
    t.index ["job_id"], name: "index_ratings_on_job_id"
    t.index ["ref_user_id"], name: "index_ratings_on_ref_user_id"
  end

  create_table "skill_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer "skill_type_id"
    t.integer "teenager_id"
    t.integer "experience_time"
    t.string "experience_quantifier"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_type_id"], name: "index_skills_on_skill_type_id"
    t.index ["teenager_id"], name: "index_skills_on_teenager_id"
  end

  create_table "teenagers", force: :cascade do |t|
    t.string "skills"
    t.integer "user_id"
    t.string "firstname"
    t.string "lastname"
    t.string "gender"
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teenagers_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "client_id"
    t.integer "teenager_id"
    t.integer "job_id"
    t.integer "payment_id"
    t.integer "amount"
    t.datetime "trans_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_transactions_on_client_id"
    t.index ["job_id"], name: "index_transactions_on_job_id"
    t.index ["payment_id"], name: "index_transactions_on_payment_id"
    t.index ["teenager_id"], name: "index_transactions_on_teenager_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text "password"
    t.integer "usertype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
