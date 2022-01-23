class CreateUserPost < ActiveRecord::Migration[7.0]
  def change
    create_table :user_posts do |t|
      t.text :title 
      t.text :body
      t.belongs_to :users, index: true, foreign_key: true
      t.timestamps  
    end
  end
end
