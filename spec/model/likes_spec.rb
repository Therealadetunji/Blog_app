require 'rails_helper'

RSpec.describe Post, type: :model do
  # tests go here
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                     postcounter: 1)
  Post.create(author: user, title: 'Half of a yellow sun', text: 'This is my first post', commentscounter: 1,
              likescounter: 2)
  like = Like.new
  before { like.save }

  it 'No like raise error' do
    expect { like.likescounter }.to raise_error(NoMethodError)
  end
end
