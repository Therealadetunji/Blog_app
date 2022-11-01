require 'rails_helper'

RSpec.describe Post, type: :model do
  # tests go here
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     postcounter: 1)
  post = Post.create(author: user, title: 'Half of a yellow sun', text: 'This is my first post', commentscounter: 1,
                     likescounter: 2)
  comment = Comment.new(post:, author: user, text: 'Hi Tom!')
  before { comment.save }

  it 'No comment raise error' do
    expect { comment.commentscounter }.to raise_error(NoMethodError)
  end
end
