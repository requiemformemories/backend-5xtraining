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

ActiveRecord::Schema.define(version: 2020_04_19_043707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "catname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catname"], name: "index_categories_on_catname", unique: true
  end

  create_table "tag_taskships", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_tag_taskships_on_tag_id"
    t.index ["task_id"], name: "index_tag_taskships_on_task_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tagname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tagname"], name: "index_tags_on_tagname", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string "taskid", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "topic", null: false
    t.text "content"
    t.integer "priority", default: 0, null: false
    t.string "status", null: false
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_tasks_on_category_id"
    t.index ["end_time"], name: "index_tasks_on_end_time"
    t.index ["priority"], name: "index_tasks_on_priority"
    t.index ["start_time"], name: "index_tasks_on_start_time"
    t.index ["status"], name: "index_tasks_on_status"
    t.index ["taskid"], name: "index_tasks_on_taskid", unique: true
    t.index ["topic"], name: "index_tasks_on_topic"
  end

  create_table "user_taskships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_user_taskships_on_task_id"
    t.index ["user_id"], name: "index_user_taskships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", null: false
    t.string "name", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

end
