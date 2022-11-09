require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe 'GET #index' do
    it 'is it a success?' do
      get '/users' # get(:index)
      expect(response).to have_http_status(:ok)
    end

    it '/users to give correct placeholder text' do
      get '/users'
      expect(response).to be_successful
    end
  end
end
