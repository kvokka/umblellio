class Blogpost < ActiveRecord::Base
  belongs_to :user
  has_one :rate
  validates :subj, presence: true
  validates :content, presence: true
end
