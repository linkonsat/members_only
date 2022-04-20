# frozen_string_literal: true

class PostsController < ApplicationController
  def all_post
    @user = User.all
  end

  def new
    @post = Post.new
  end

  def index
    if(!params.key?("page_number"))
      @post = Post.initial_index_page_posts
      @page_link_count = Post.all_posts_page_count
    else
      @page_link_count = Post.all_posts_page_count
      @post = Post.display_index_posts(params)
    end
  end

  def create
    @post = Post.new(post_params)

    if(@post.save)
    flash.alert = 'Post was sucessfully created! x'
    redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def post_records
  end

  def post_params
    params.require(:post).permit(:title, :body, :preview, :user_id, :page_number)
  end
end
