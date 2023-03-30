class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_likes_counter
    post.increment!(:likesCounter)
  end
end
