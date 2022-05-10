class AddUserGameStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :game_statistics do |t|
      t.belongs_to :user_game, foreign_key: true
      t.integer :high_score
      t.timestamps
    end
  end
end
