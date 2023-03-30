class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def self.recent_three_posts(name)
    author = User.find_by(name:).id
    Post.where(author_id: author).order(created_at: :desc).limit(3)
  end
end
