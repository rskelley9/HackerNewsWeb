require 'faker'

websites = ['http://google.com', 'http://yankees.com', 'http://ebay.com', 'http://yahoo.com']

3.times do
  User.create(email: Faker::Internet.email, password: 'password')
end

15.times do
  Post.create(user_id: [1,2,3].sample, post_title: Faker::Lorem.sentence(word_count = 4), source: websites.sample)
end 


10.times do
  Comment.create(user_id: [1,2,3].sample, post_id: rand(1..15), comment_title: Faker::Lorem.sentence(word_count = rand(1..10)))
end



