require 'rails_helper'

RSpec.describe 'user index-page', type: :feature do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        postcounter: 1)

    @post = Post.create(author: @user, title: 'Half of a yellow sun', text: 'This is my first post', commentscounter: 1,
                        likescounter: 2)
    @comments = Comment.create(post: @post, author: @user, text: 'Hi Tom!')

    visit users_post_path(@user, @post)
  end

  describe 'index.html.erb displays for the user' do
    it "display post's title" do
      expect(page).to have_content(@post.title)
    end

    it 'the user that wrote the post' do
      expect(page).to have_content('Tom')
    end

    it 'number of comments it has' do
      expect(page).to have_content(@post.commentscounter)
    end

    it 'likes counter' do
      expect(page).to have_content(@post.likescounter)
    end

    it 'the post body' do
      expect(page).to have_content(@post.text)
    end

    it 'username of the commentor' do
      expect(page).to have_content(@comments.author.name)
    end
    

    #Anasy code here
    it 'each comment by a commentor' do
      expect(page).to have_content('Hi Tom!')
    end
  end
end
