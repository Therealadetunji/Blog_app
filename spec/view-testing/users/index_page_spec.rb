require 'rails_helper'

RSpec.describe 'user index-page', type: :feature do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        postcounter: 1)
  end

  describe 'index.html.erb displays for the user' do
    it "display the user's name" do
      visit users_path(@user)
      expect(page).to have_content(@user.name)
    end
    it "display the user's profile photo" do
      visit users_path(@user)
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
    it 'display number of post for a user' do
      visit users_path(@user)
      expect(page).to have_content(@user.postcounter)
    end
    it 'have a link to show.html.erb' do
      visit users_path(@user)
      click_on 'Tom'
      expect(page).to have_content(@user.bio)
    end
  end
end
