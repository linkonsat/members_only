# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Returns the requested posts.' do
    parameters = { "page_number" => 2}
    create(:user)
    50.times do 
      create(:post, :user_id => User.first.id)
    end
    retrieved_posts = Post.display_index_posts(parameters)
    puts retrieved_posts.first
    expect(retrieved_posts.first.id).to_not eql(1)
  end
  it 'Successfully returns the number of total pages' do
      create(:user)
    50.times do 
      create(:post, :user_id => User.first.id)
    end
      post_count = Post.all_posts_page_count
      expect(post_count).to eql(2)
  end
end
