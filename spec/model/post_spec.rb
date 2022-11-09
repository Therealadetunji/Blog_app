require 'rails_helper'

RSpec.describe Post, type: :model do
  # tests go here
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     postcounter: 1)
  post = Post.new(author: user, title: 'Half of a yellow sun', text: 'This is my first post', commentscounter: 1,
                  likescounter: 2)

  it 'title must be present' do
    post.title = 'Half of a yellow sun'
    expect(post).to be_valid
  end

  it 'post shouldnt be more than 250 words' do
    post.title = 'Half of a yellow sun'
    expect(post).to be_valid
  end

  it 'comments counter test' do
    post.commentscounter = 1
    expect(post).to be_valid
  end

  it 'likes counter test' do
    post.likescounter = 2
    expect(post).to be_valid
  end
end
