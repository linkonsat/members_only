class AddUserGame < ActiveRecord::Migration[7.0]
  def change
    create_table :user_games do |t|
      t.belongs_to :game_profile, foreign_key: true
      t.text :title 
      t.timestamps
    end
  end
end
