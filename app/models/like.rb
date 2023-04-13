class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_likes_counter(_id)
    post = Post.find(post_id)
    counter = post.likes.count
    post.update(likesCounter: counter)
  end
end
