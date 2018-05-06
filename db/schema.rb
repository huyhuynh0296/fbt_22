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

ActiveRecord::Schema.define(version: 20180504071132) do

  create_table "bookingtours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "tour_id"
    t.integer "price"
    t.integer "amount_persion"
    t.integer "status", default: 0
    t.integer "datetour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tours_id"
    t.bigint "users_id"
    t.index ["tours_id"], name: "index_bookingtours_on_tours_id"
    t.index ["users_id"], name: "index_bookingtours_on_users_id"
  end

<<<<<<< HEAD
  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_books_on_store_id"
  end

=======
>>>>>>> a5f22ce... signup-login-logout
  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "comment"
    t.integer "tour_id"
    t.integer "user_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tours_id"
    t.bigint "users_id"
    t.index ["tours_id"], name: "index_comments_on_tours_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "datetours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "tour_id"
    t.string "starttime"
    t.string "stoptime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bookingtours_id"
    t.index ["bookingtours_id"], name: "index_datetours_on_bookingtours_id"
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "tour_id"
    t.string "url"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tours_id"
    t.index ["tours_id"], name: "index_images_on_tours_id"
  end

  create_table "places", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "point"
    t.integer "user_id"
    t.integer "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tours_id"
    t.bigint "users_id"
    t.index ["tours_id"], name: "index_ratings_on_tours_id"
    t.index ["users_id"], name: "index_ratings_on_users_id"
  end

<<<<<<< HEAD
  create_table "stores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

=======
>>>>>>> a5f22ce... signup-login-logout
  create_table "tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "image"
    t.text "description"
    t.integer "price"
    t.integer "category_id"
    t.integer "place_id"
    t.integer "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "categories_id"
    t.bigint "places_id"
    t.index ["categories_id"], name: "index_tours_on_categories_id"
    t.index ["places_id"], name: "index_tours_on_places_id"
  end

  create_table "userpays", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "bankname"
    t.string "acountnumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_userpays_on_users_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
<<<<<<< HEAD
    t.string "username"
    t.string "email"
    t.string "password"
    t.string "address"
    t.string "numberphone"
    t.integer "role"
    t.string "images"
=======
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.string "avatar"
    t.string "remember_digest"
>>>>>>> a5f22ce... signup-login-logout
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookingtours", "tours", column: "tours_id"
  add_foreign_key "bookingtours", "users", column: "users_id"
  add_foreign_key "comments", "tours", column: "tours_id"
  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "datetours", "bookingtours", column: "bookingtours_id"
  add_foreign_key "images", "tours", column: "tours_id"
  add_foreign_key "ratings", "tours", column: "tours_id"
  add_foreign_key "ratings", "users", column: "users_id"
  add_foreign_key "tours", "categories", column: "categories_id"
  add_foreign_key "tours", "places", column: "places_id"
  add_foreign_key "userpays", "users", column: "users_id"
end
