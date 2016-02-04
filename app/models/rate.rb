class Rate < ActiveRecord::Base
  belongs_to :blogpost
  validates :rating, numericality: { only_integer:             true,
                                     greater_than_or_equal_to: 1,
                                     less_than_or_equal_to:    5 }
  validates :blogpost_id, presence: true
  after_save :update_blogpost

  private

    def update_blogpost
      blogpost = self.blogpost
      rate = rating
      blogpost.update_rating! rate
    end
end
