class PostsController < ApplicationController
    def all_post
        @user = User.all
    end
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        @post.save
        flash.alert = "Post was sucessfully created!"
        redirect_to "/"
    end

    def post_params
        params.require(:post).permit(:title, :body, :preview, :user_id)
      end
end
