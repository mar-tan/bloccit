require 'random_data'

# Create Users

5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

# Create Topics
15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph,
    public: rand(1..4) != 1 
  )
end
topics = Topic.all
puts "#{Topic.count} topics created"
puts "#{Topic.where(public: false).count} private topics created"

# Create Posts
50.times do |i|
    Post.create!(
      user: users.sample,
      topic: topics.sample,
      title: "#{i}_" + RandomData.random_sentence,
      body: "#{i}_" + RandomData.random_paragraph
    )
end
posts = Post.all
puts "#{Post.count} posts created"

# Create Comments
100.times do |i|
  Comment.create!(
    post: posts.sample,
    body: "#{i}_" + RandomData.random_paragraph
  )
end
puts "#{Comment.count} comments created"

user = User.first
user.update_attributes!(
  email: 'mwoldenberg@gmail.com',
  password: '123456987'
)

puts "Seed finished"

