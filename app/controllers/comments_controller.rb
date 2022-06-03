class CommentsController < ApplicationController

    def new 
    end

    def create
        @comment = Comment.new(comment_params)
        if(@comment.save)
        flash.alert = 'Comment was sucessfully created! x'
        else
            redirect_to "/"
            flash.alert = 'Comment was not created created! x'
        end
      end

      def comment_params 
        params.require(:comment).permit(:title, :body, :preview, :user_id, :post_id)
      end
end
