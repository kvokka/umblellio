require 'rails_helper'

RSpec.describe Post, type: :model do
  it {should belong_to :user}
  it {should     have_one :rate}
  it {should validate_presence_of :subj}
  it {should validate_presence_of :content}
end
