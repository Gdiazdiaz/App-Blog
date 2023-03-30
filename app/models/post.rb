class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def self.update_posts_counter
    author.increment!(:postsCounter)
  end

  def self.recent_five_comments(title)
    post = Post.find_by(title:).id
    Comment.where(post_id: post).order(created_at: :desc).limit(3)
  end
end
