FactoryGirl.define do
  factory :blogpost do
    subj 'MyString'
    content 'MyText'
    autor_ip '192.168.0.1'
  end
  factory :blogpost_invalid, class: :blogpost do
    subj nil
    content nil
    autor_ip '192.168.0.1'
  end
end
