require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', postsCounter: 0) }

  before do
    subject.save
    subject.posts.create(author: subject, title: 'Hello', text: 'This is my first post', commentsCounter: 0,
                         likesCounter: 0)
    subject.posts.create(author: subject, title: 'Bye', text: 'This is my last post', commentsCounter: 0,
                         likesCounter: 0)
    subject.posts.create(author: subject, title: 'Greetings', text: 'This is my first post of the day',
                         commentsCounter: 0, likesCounter: 0)
    subject.posts.create(author: subject, title: 'Clock', text: 'This is my first post of the hour',
                         commentsCounter: 0, likesCounter: 0)
    subject.posts.create(author: subject, title: 'Vacations', text: 'This is my first post of my vacations',
                         commentsCounter: 0, likesCounter: 0)
  end

  it 'user should be valid' do
    expect(subject).to be_valid
  end

  it 'if title is not present, user must not be valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postsCounter should be an integer and greater than or equal to: 0 otherwise is not valid' do
    subject.postsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'returns the three posts' do
    expect(User.recent_three_posts('Tom').length).to eq 3
  end

  it 'returns the three most recent posts' do
    expect(User.recent_three_posts('Tom')[0].created_at).to be > User.recent_three_posts('Tom')[2].created_at
  end
end
