require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  before(:each) do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    visit users_path
  end

    it 'shows the name of all the users' do 
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user2.name)
  end

  it 'shows the profile picture of each user' do
    expect(page).to have_selector("img[src*='#{@user.photo}']")
    expect(page).to have_selector("img[src*='#{@user2.photo}']")
  end

  it 'shows the number pf posts each user has written' do
    expect(page).to have_content(@user.postsCounter)
    expect(page).to have_content(@user2.postsCounter)
  end

  it 'redirects me to that users page' do
    link = find("a[href='#{user_path(@user)}']")
    link.click
    expect(page).to have_current_path(user_path(@user))
  end

end