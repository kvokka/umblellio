require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :blogposts }
  describe 'post_owner' do
    let!(:user) { create(:user) }
    it 'find existing user' do
      expect(User.post_owner('usr')).to eq user
    end
    it 'generate new user' do
      expect(User.post_owner('usr_new')).to eq User.find_by_login 'usr_new'
    end
  end
end
