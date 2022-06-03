class Comment < ApplicationRecord
    belongs_to :post 
    belongs_to :user

    validate :unique_like 

    def unique_like 
        post_comments = self.post.comments
        post_comments.each do |comment|
            if(comment.user_id == self.user_id)
                errors.add(:already_commented, "You already commented on this.")
            end
        end
    end
end
