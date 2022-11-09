require 'rails_helper'

RSpec.describe 'user index-page', type: :feature do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        postcounter: 1)
    @post = @user.posts.create(title: 'examples', text: 'This is the second post i think')
    @user.posts.create(title: 'food', text: 'been programming all day literally')
    @user.posts.create(title: 'meeting', text: 'time for stand up meeting')
    @user.posts.create(title: 'Hello', text: 'Hi, dear')

    visit user_path(@user)
  end

  describe 'index.html.erb displays for the user' do
    it "display the user's profile picture" do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    it "display the user's name" do
      expect(page).to have_content(@user.name)
    end
    # ushindi code here

    it 'display the bio of the user' do
      expect(page).to have_content(@user.bio)
    end
    it 'display number of post for a user' do
      expect(page).to have_content(@user.postcounter)
    end 
    it 'display the first three post' do
      expect(page).to have_text('This is the second post i think')
      expect(page).to have_text('been programming all day literally')
      expect(page).to have_text('time for stand up meeting')
    end

    it " to see a button that lets me view all of a user's posts" do
      expect(page).to have_button('see all posts')
    end

    it " click a user's post, it redirects to that post's show page." do
      click_link("post#{@post.id}")
      expect(page).to have_content(@post.text)
    end

    it " click on see all posts, it redirects to the user's post's index page." do
      click_button('see all posts')
      expect(page).to have_content('Hello')
    end
  end
end
