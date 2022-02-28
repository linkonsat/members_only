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

        @post.save
        flash.alert = "Post was sucessfully created!"
        redirect_to "/"
    end

    def post_records 
        PostRecordsJob.perform_async('bob', 5)
    end

    def post_params
        params.require(:post).permit(:title, :body, :preview, :user_id)
      end
end
