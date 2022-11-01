require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    it 'is it a success?' do
      get '/users/3/posts' # get(:index)
      expect(response).to have_http_status(:ok)
    end

    it '/users to give correct placeholder text' do
      get '/users/3/posts'
      expect(response).to be_successful
      expect(response.body).to include('display all the posts for a specific user')
    end
  end
end
