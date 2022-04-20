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
      @post = Post.where(id: (0)..25)
      @page_link_count = Post.all.length / 25
    else
      @page_link_count = Post.all.length / 25
      chosen_link = @page_link_count - params["page_number"].to_i 
      start_count = chosen_link * 25
      end_count = (chosen_link + 1) * 25
      @post = Post.where(id: (start_count)..end_count)
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
