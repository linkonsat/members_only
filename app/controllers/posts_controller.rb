# frozen_string_literal: true

class PostsController < ApplicationController
  def all_post
    @user = User.all
  end

  def new
    @post = Post.new
  end

  def index
    @post = Post.all
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
    params.require(:post).permit(:title, :body, :preview, :user_id)
  end
end
