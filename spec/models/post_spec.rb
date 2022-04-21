# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Retrieves the first 25 batch of posts' do
    create(:user)
    25.times do 
    create(:post)
    end
    posts = Post.initial_index_page_posts
    expect(posts.length).to eql(25)
    FactoryBot.rewind_sequences
  end


  it 'It can count the amount of index links' do
    create(:user)
    45.times do 
    create(:post)
    end
    page_count = Post.all_posts_page_count
    expect(page_count).to eql(1)
    FactoryBot.rewind_sequences
  end
  it "Retrieves the specified post from the params parameters." do 
    create(:user)
    45.times do 
      create(:post)
    end
    params_hash = { "page_number" => "1" }
    retrieved_posts = Post.display_index_posts(params_hash)
    expect(retrieved_posts.length).to eql(25)
    FactoryBot.rewind_sequences
  end
end
