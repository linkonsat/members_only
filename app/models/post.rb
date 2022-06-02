# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  scope :initial_index_page_posts, -> { where(id: (0)..25) }
  scope :all_posts_page_count, -> { all.length / 25}

  def self.display_index_posts(params)
    page_link_count = Post.all_posts_page_count
    chosen_link = page_link_count - params["page_number"].to_i 
    start_count = chosen_link * 25 + Post.first.id
    end_count = (chosen_link + 1) * 25 + Post.first.id
    posts = Post.where(id: (start_count)..end_count)
  return posts
  end
end
