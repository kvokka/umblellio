FactoryGirl.define do
  factory :rates do
    sequence(:rating) { |n| (n % 5) + 1 }
    blogpost
  end

  factory :rate_with_value, class: Rate do
    rating 1
    blogpost
  end
end
