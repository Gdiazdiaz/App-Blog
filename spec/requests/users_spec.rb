require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    let(:user) { FactoryBot.create(:user) }

    before { get users_path(user) }

    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('All our users')
    end
  end

  describe 'GET #show' do
    let(:user) { FactoryBot.create(:user) }

    before { get user_path(user) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text in the response body' do
      expect(response.body).to include('Number of posts:')
    end
  end
end
