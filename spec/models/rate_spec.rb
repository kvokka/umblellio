require 'rails_helper'

RSpec.describe Rate, type: :model do
  it { should belong_to :blogpost }
  it { should validate_presence_of :blogpost_id }
  it { should validate_numericality_of :rating }
end
