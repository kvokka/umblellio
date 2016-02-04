FactoryGirl.define do
  factory :rates do
    sequence(:rating) { |n| (n % 5) + 1 }
    blogpost
  end

  factory :rate1, class: Rate do
    rating 1
    blogpost
  end
  factory :rate2, class: Rate do
    rating 2
    blogpost
  end
  factory :rate3, class: Rate do
    rating 3
    blogpost
  end
  factory :rate4, class: Rate do
    rating 4
    blogpost
  end
  factory :rate5, class: Rate do
    rating 5
    blogpost
  end
end
