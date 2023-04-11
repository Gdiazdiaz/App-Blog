require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, author: @user)
    @post2 = FactoryBot.create(:post, author: @user)
    @post3 = FactoryBot.create(:post, author: @user)
    @comment = FactoryBot.create(:comment)
    @like = FactoryBot.create(:like)
    visit user_path(@user)
  end

  it 'Shows the profile picture' do
    expect(page).to have_selector("img[src*='#{@user.photo}']")
  end

  it 'Shows the username' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts each user has written' do
    expect(page).to have_content(@user.postsCounter)
  end

  it 'shows the bio' do
    expect(page).to have_content(@user.bio)
  end

  it 'shows the first 3 posts' do
    expect(page).to have_content(@post.text)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
  end

  it 'shows the all posts button' do
    expect(page).to have_content('See all posts')
  end

  it 'redirects me to a specif post' do
    link = find("a[href='#{user_post_path(@post.author, @post)}']")
    link.click
    expect(page).to have_current_path(user_post_path(@post.author, @post))
  end

  it 'redirects me to all posts' do
    link = find("a[href='#{user_posts_path(@user)}']")
    link.click
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
