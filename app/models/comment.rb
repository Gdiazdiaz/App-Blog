class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comments_counter(_id)
    post = Post.find(post_id)
    counter = post.comments.count
    post.update(commentsCounter: counter)
  end
end
