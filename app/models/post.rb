class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { in: 1..250, too_long: 'only %<count>s characters allowed' }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.recent_five_comments(title)
    post = Post.find_by(title:).id
    Comment.where(post_id: post).order(created_at: :desc).limit(3)
  end

  def update_posts_counter(id)
    user = User.find(id)
    counter = user.posts.count
    user.update(postsCounter: counter)
  end
end
