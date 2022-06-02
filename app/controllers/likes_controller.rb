class LikesController < ApplicationController

    def new 
        @like = Like.new(like_params)
        @like.save
    end

    def create
    end

    def like_params
        params.permit(:user_id, :post_id)
    end
end
