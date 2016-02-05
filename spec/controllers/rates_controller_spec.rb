require 'rails_helper'

RSpec.describe RatesController, type: :controller do
  describe 'POST #create' do
    let!(:blogpost) { create(:blogpost) }
    context 'invalid' do
      it 'should do nothing with invalid attr' do
        post :create, blogpost_id: blogpost.id, rates: { rating: 0 }, format: :json
        expect(response).to have_http_status 200
        expect(response.body).to eq ''
      end
    end
    context 'valid' do
      let(:rate_with_value) { create(:rate_with_value) }
      it 'should calc rating' do
        100.times do
          post :create, blogpost_id: blogpost.id, rates: attributes_for(:rate_with_value, rating: 1), format: :json
        end
        700.times do
          post :create, blogpost_id: blogpost.id, rates: attributes_for(:rate_with_value, rating: 5), format: :json
        end

        expect(response.body).to eq '4.5'
      end
    end
  end
end
