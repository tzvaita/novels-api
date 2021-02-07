require 'rails_helper'

RSpec.describe 'Novels API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:novels) { create_list(:novel, 10, user_id: user.id) }
  let(:novel_id) { novels.first.id }

  # Test suite for GET /novels
  describe 'GET /novels' do
    # make HTTP get request before each example
    before { get '/novels' }

    it 'returns novels' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /novels/:id
  describe 'GET /novels/:id' do
    before { get "/novels/#{novel_id}" }

    context 'when the record exists' do
      it 'returns the novel' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(novel_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:novel_id) { 10076 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Novel/)
      end
    end
  end

  # Test suite for POST /novels
  describe 'POST /novels' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', user_id: user.id } }

    context 'when the request is valid' do
      before { post '/novels', params: valid_attributes }

      it 'creates a novel' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/novels', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: User must exist, User can't be blank/)
      end
    end
  end

  # Test suite for PUT /novels/:id
  describe 'PUT /novels/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/novels/#{novel_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /novels/:id
  describe 'DELETE /novels/:id' do
    before { delete "/novels/#{novel_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end