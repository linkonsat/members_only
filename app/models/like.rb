class Like < ApplicationRecord
    belongs_to :post
    belongs_to :user

    validate :unique_like 

    def unique_like 
        post_likes = self.post.likes 
        post_likes.each do |like|
            if(like.user_id == self.user_id)
                errors.add(:already_likes, "You already liked this.")
            end
        end
    end
end
