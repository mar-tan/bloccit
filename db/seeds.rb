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
  post = Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: "#{i}_" + RandomData.random_sentence,
    body: "#{i}_" + RandomData.random_paragraph
  )

  post.update_attribute(:created_at, rand(10.minutes ..1.year).ago)
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end
posts = Post.all
puts "#{Post.count} posts created"
puts "#{Vote.count} votes created"

# Create Comments
100.times do |i|
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: "#{i}_" + RandomData.random_paragraph
  )
end
puts "#{Comment.count} comments created"

# Create an admin users
admin = User.create!(
  name:     'Admin User',
  email:    'admin@admin.com',
  password: 'adminz',
  role:     'admin'
)

# Create a member
member = User.create!(
  name:     'Member User',
  email:    'member@member.com',
  password: 'member'
)

puts "Seed finished"
