require 'rails_helper'

RSpec.describe 'user index-page', type: :feature do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        postcounter: 1)

    @post = Post.create(author: @user, title: 'Half of a yellow sun', text: 'This is my first post', commentscounter: 1,
                        likescounter: 2)
    @comments = Comment.create(post: @post, author: @user, text: 'Hi Tom!')
  end

  describe 'index.html.erb displays for the user' do
    it "display user's profile picture" do
      visit users_posts_path(@user)
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
    it "display the user's name in post index page" do
      visit users_posts_path(@user)
      expect(page).to have_content(@user.name)
    end

    it 'the number of posts the user has written' do
      visit users_posts_path(@user)
      expect(page).to have_content(@user.postcounter)
    end

    it 'see the post title' do
      visit users_posts_path(@user)
      expect(page).to have_content(@post.title)
    end

    it 'the posts body' do
      visit users_posts_path(@user)
      expect(page).to have_content(@post.text)
    end

    it 'first comments on a post' do
      visit users_posts_path(@user)
      expect(page).to have_content(@post.comments.first.text)
    end

    it 'number of comments a post has' do
      visit users_posts_path(@user)
      expect(page).to have_content(@post.commentscounter)
    end

    it 'number of likes' do
      visit users_posts_path(@user)
      expect(page).to have_content(@post.likescounter)
    end

    it 'should show a section for pagination if there are more posts than fit on the view' do
      visit users_posts_path(@user)
      expect(page).to have_button('Pagination')
    end

    it "click on a post, it redirects to that post's show page." do
      visit users_posts_path(@user)
      click_link("post#{@post.id}")
      expect(page).to have_content(@post.text)
    end
  end
end
