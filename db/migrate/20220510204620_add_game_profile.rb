class AddGameProfile < ActiveRecord::Migration[7.0]
  def change
    create_table :game_profiles do |t|
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
