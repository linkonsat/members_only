class AddGameCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :game_categories do |t|
      t.belongs_to :all_game, foreign_key: true
      t.text :category
      t.integer :rating
      t.timestamps
    end
  end
end
