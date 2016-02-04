class Blogpost < ActiveRecord::Base
  belongs_to :user
  has_many :rates
  validates :subj, presence: true
  validates :content, presence: true

  def update_rating!(rate)
    return nil unless (1..5).cover? rate
    self.rate_sum += rate
    self.rate_count += 1
  end

  def rating
    return 0 if self.rate_count == 0
    self.rate_sum / self.rate_count
  end
end
