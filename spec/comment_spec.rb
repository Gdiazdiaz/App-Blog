require 'rails_helper'
RSpec.describe Comment, type: :model do
  subject = Post.new(
    author: User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     postsCounter: 0), title: 'Hello', text: 'This is my first post', commentsCounter: 0,
    likesCounter: 0
  )
  before do
    subject.save
    subject.comments.create(author: subject.author, post: subject, text: 'Hello')
    subject.comments.create(author: subject.author, post: subject, text: 'Bye')
  end

  it 'Each comment should add 1 to the counter' do
    expect(subject.commentsCounter).to eq 2
  end
end
