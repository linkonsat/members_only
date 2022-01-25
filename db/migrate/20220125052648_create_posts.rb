class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :preview
      t.string :body
      t.belongs_to :users, index: true, foreign_key: true
      t.timestamps
    end
  end
end
