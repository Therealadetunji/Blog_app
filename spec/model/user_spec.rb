require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                  postcounter: 1)

  before { user.save }
  it 'name must be present' do
    user.name = 'Tom'
    expect(user).to be_valid
  end

  it 'postcounter should increment afer a post' do
    user.postcounter = 1
    expect(user).to be_valid
  end
end
