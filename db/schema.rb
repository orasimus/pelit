# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100901153204) do

  create_table "developers", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.string   "name"
    t.string   "release_year"
    t.integer  "developer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_platforms", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "platform_id"
  end

  add_index "games_platforms", ["game_id"], :name => "index_games_platforms_on_game_id"
  add_index "games_platforms", ["platform_id", "game_id"], :name => "index_games_platforms_on_platform_id_and_game_id", :unique => true

  create_table "games_tags", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "tag_id"
  end

  add_index "games_tags", ["game_id"], :name => "index_games_tags_on_game_id"
  add_index "games_tags", ["tag_id", "game_id"], :name => "index_games_tags_on_tag_id_and_game_id", :unique => true

  create_table "notes", :force => true do |t|
    t.integer  "game_id"
    t.string   "info"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platforms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
