class AddAllGames < ActiveRecord::Migration[7.0]
  def change
    create_table :all_games do |t|
    t.timestamps
    end
  end
end
