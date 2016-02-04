# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

100.times do |user_num|
  user = User.create(login: "#{Faker::Name.name}#{user_num}")
  2000.times do |blogpost_num|
    blogpost = Blogpost.create(subj:     "#{Faker::Hipster.sentence}#{blogpost_num}",
                               content:  "#{Faker::Hipster.paragraph}#{blogpost_num}",
                               autor_ip: Faker::Internet.public_ip_v4_address.to_s,
                               user_id:  user.id)
    next unless blogpost_num % 3 == 0
    rand(5..20).times do
      Rate.create(rating: rand(1..5), blogpost_id: blogpost.id)
    end
  end
end
