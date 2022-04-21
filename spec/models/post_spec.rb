# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Retrieves the first 25 batch of posts' do
    create(:user)
    create_list(:post, 25)
    posts = Post.initial_index_page_posts
    expect(posts.length).to eql(25)
  end
  it 'Succesfully gets multiple posts' do
  end
end
