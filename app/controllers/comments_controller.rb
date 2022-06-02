class CommentsController < ApplicationController

    def new 

    end

    def create
        @comment = Comment.new(comment_params)
    
        if(@comment.save)
        flash.alert = 'Comment was sucessfully created! x'
        else
          render :new, status: :unprocessable_entity
        end
      end

      def comment_params 
        params.permit(:title, :body, :preview, :user_id, :post_id)
      end
end
