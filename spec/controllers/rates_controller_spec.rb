require 'rails_helper'

RSpec.describe RatesController, type: :controller do
  describe 'POST #create' do
    let!(:blogpost) { create(:blogpost) }
    context 'invalid' do
      it 'should do nothing with invalid attr' do
        #  post :create, blogpost_id: blogpost.id, rates: { rating: 0, blogpost_id: blogpost.id }, format: :json
        post :create, blogpost_id: blogpost.id, rates: { rating: 0 }, format: :json
        expect(response).to have_http_status 200
        expect(response.body).to eq '0'
      end
    end
    context 'valid' do
      let(:rate1) { create(:rate1) }
      let(:rate2) { create(:rate2) }
      let(:rate3) { create(:rate3) }
      let(:rate4) { create(:rate4) }
      let(:rate5) { create(:rate5) }
      it 'should calc rating' do
        post :create, blogpost_id: blogpost.id, rates: attributes_for(:rate1), format: :json
        expect(response.body).to eq '1'
      end
    end
  end
end
