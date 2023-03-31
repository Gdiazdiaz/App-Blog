require 'rails_helper'
RSpec.describe Post, type: :model do
  subject { Post.new(author: User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', postsCounter: 0), title: 'Hello', text: 'This is my first post', commentsCounter: 0, likesCounter: 0) }
  before do
    subject.save
    subject.comments.create(post: subject, author: subject.author, text: 'Hi Tom!')
    subject.comments.create(post: subject, author: subject.author, text: 'bye Tom')
    subject.comments.create(post: subject, author: subject.author, text: 'Greetings Tom')
    subject.comments.create(post: subject, author: subject.author, text: 'Hellu')
    subject.comments.create(post: subject, author: subject.author, text: 'Bye bye')
  end

  it 'post should be valid' do
    expect(subject).to be_valid
  end

  it 'post should be invalid if title is not present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'post should be invalid if title is longer than 250 characters' do
    subject.title = 'Now we will create it blocks for each behaviour were
        expecting in the Movies model. So remember to be as clear as possible
        when describe your tests because you need to be a good communicator and
        make yourself understandable not only with computers but also with people.'
    expect(subject).to_not be_valid
  end

  it 'commentsCounter should be an integer and greater than or equal to: 0 otherwise is not valid' do
    subject.commentsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'likesCounter should be an integer and greater than or equal to: 0 otherwise is not valid' do
    subject.likesCounter = -1
    expect(subject).to_not be_valid
  end

  it 'returns five comments' do
    expect(Post.recent_five_comments('Hello').length).to eq 3
  end

  it 'returns the five most recent comments' do
    expect(Post.recent_five_comments('Hello')[0].created_at).to be > Post.recent_five_comments('Hello')[2].created_at
  end
end
