require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, author: @user)
    @comment = FactoryBot.create(:comment, author: @user, post: @post)
    @comment2 = FactoryBot.create(:comment, author: @user, post: @post)
    @comment3 = FactoryBot.create(:comment, author: @user, post: @post)
    @like = FactoryBot.create(:like, author: @user, post: @post)
    @like2 = FactoryBot.create(:like, author: @user, post: @post)
    visit user_post_path(@post.author, @post)
  end

  it 'Shows the title' do
    expect(page).to have_content(@post.title)
  end

  it 'Shows the name of the author' do
    expect(page).to have_content(@post.author.name)
  end

  it 'shows the number of comments' do
    expect(page).to have_content(@post.commentsCounter)
  end

  it 'shows the number of likes' do
    expect(page).to have_content(@post.likesCounter)
  end

  it 'Shows the body of the post' do
    expect(page).to have_content(@post.text)
  end

  it 'Shows the name of the commenter' do
    expect(page).to have_content(@comment.author.name)
  end

  it 'Shows the body of the comment' do
    expect(page).to have_content(@comment.text)
  end
end
