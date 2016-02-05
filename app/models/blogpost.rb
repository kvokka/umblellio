class Blogpost < ActiveRecord::Base
  belongs_to :user
  has_many :rates
  validates :subj, presence: true
  validates :content, presence: true

  def update_rating!(rate)
    return nil unless (1..5).cover? rate
    self.rate_sum += rate
    self.rate_count += 1
    save
  end

  def rating
    return 0 if self.rate_count == 0
    (self.rate_sum.to_f / self.rate_count).round(2)
  end

  def self.get_top(n)
    where('rate_count > 0')
      .select('*, avg((0.0 + rate_sum)/nullif(rate_count,0)) as rate ')
      .group('id')
      .order('rate desc')
      .limit(n)
  end
end
