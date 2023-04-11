require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, :author => @user)
    @post2 = FactoryBot.create(:post, :author => @user)
    @post3 = FactoryBot.create(:post, :author => @user)
    @comment = FactoryBot.create(:comment, :author => @user, :post => @post)
    @comment2 = FactoryBot.create(:comment, :author => @user, :post => @post)
    @comment3 = FactoryBot.create(:comment, :author => @user, :post => @post)
    @like = FactoryBot.create(:like, :author => @user, :post => @post)
    @like2 = FactoryBot.create(:like, :author => @user, :post => @post)
    visit user_posts_path(@user)
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

  it 'Shows the titles' do
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post3.title)
  end

  it 'Shows the content' do
    expect(page).to have_content(@post.text)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
  end

  it 'Shows the comments' do
    expect(page).to have_content(@comment.text)
    expect(page).to have_content(@comment2.text)
    expect(page).to have_content(@comment3.text)
  end

  it 'shows the number of comments on each post' do
    expect(page).to have_content(@post.commentsCounter)
  end

  it 'shows the number of likes on each post' do
    expect(page).to have_content(@post.likesCounter)
  end

  it 'shows a button for pagination' do
    expect(page).to have_content('Pagination')
  end

  it 'redirects me to a specif post' do
    link = find("a[href='#{user_post_path(@post.author, @post)}']")
    link.click
    expect(page).to have_current_path(user_post_path(@post.author, @post))
  end
end
