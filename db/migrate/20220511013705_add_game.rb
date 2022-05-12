class AddGame < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.belongs_to :game_categorie, foreign_key: true
      t.text :title 
      t.text :category
      t.text :description
      t.timestamps
    end
  end
end
