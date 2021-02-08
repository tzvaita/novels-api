require 'rails_helper'

RSpec.describe 'Novels API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:novel) { create(:novel, user_id: user.id)}
  let(:novel2) { create(:novel, user_id: user2.id)}
  let!(:favorites) { create(:favorite, liker_id: user.id, liked_id: novel.id) }
  let(:favorite_id) { favorites.id }

  # Test suite for GET /favorites
  describe 'GET /favorites' do
    # make HTTP get request before each example
    before { get '/favorites' }

    it 'returns favorites' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  
  # Test suite for POST /favorites
  describe 'POST /favorites' do
    # valid payload
    let(:valid_attributes) { { liked_id: novel2.id, liker_id: user2.id } }

    context 'when the request is valid' do
      before { post '/favorites', params: valid_attributes }

      # it 'creates a favorite' do
      #   expect(json['title']).to eq('Learn Elm')
      # end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/favorites', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Liker must exist, Liked must exist, Liker can't be blank, Liked can't be blank/)
      end
    end
  end

  # Test suite for DELETE /favorites/:id
  describe 'DELETE /favorites/:id' do
    before { delete "/favorites/#{favorite_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end