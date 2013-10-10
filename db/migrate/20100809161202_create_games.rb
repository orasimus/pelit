class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name
      t.string :release_year
      t.integer :developer_id

      t.timestamps
    end
    
    create_table :games_platforms, :id => false do |t|
      t.integer :game_id
      t.integer :platform_id
    end
    
    add_index :games_platforms, [:platform_id, :game_id], :unique => true
    add_index :games_platforms, :game_id, :unique => false
    
    create_table :games_tags, :id => false do |t|
      t.integer :game_id
      t.integer :tag_id
    end
    
    add_index :games_tags, [:tag_id, :game_id], :unique => true
    add_index :games_tags, :game_id, :unique => false
  end

  def self.down
    drop_table :games
  end
end
