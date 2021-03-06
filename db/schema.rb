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

ActiveRecord::Schema.define(version: 2020_03_07_062707) do

  create_table "todo_comments", force: :cascade do |t|
    t.string "text", null: false
    t.integer "todo_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_item_id", "text"], name: "index_todo_comments_on_todo_item_id_and_text"
    t.index ["todo_item_id"], name: "index_todo_comments_on_todo_item_id"
  end

  create_table "todo_items", force: :cascade do |t|
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["text"], name: "index_todo_items_on_text"
  end

end
