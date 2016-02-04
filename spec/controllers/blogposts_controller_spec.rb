require 'rails_helper'

RSpec.describe BlogpostsController, type: :controller do
  let!(:user) { create(:user) }
  describe 'POST #create' do
    context 'valid post' do
      let!(:blogpost) { create(:blogpost) }
      it 'should create new' do
        post :create, blogpost: attributes_for(:blogpost).merge(login: user.login), format: :json
        expect(assigns(:post)).to eq Blogpost.last
        expect(response).to have_http_status 201
      end
    end
    context 'invalid post' do
      let(:blogpost_invalid) { create(:blogpost_invalid) }
      it 'should not create new' do
        post :create, blogpost: attributes_for(:blogpost_invalid).merge(login: user.login), format: :json
        expect(response).to have_http_status 422
      end
      it 'DB will not changes' do
        expect do
          post :create, blogpost: attributes_for(:blogpost_invalid).merge(login: user.login),
                        format:   :json
        end.to_not change(Blogpost, :count)
      end
    end
  end
end
