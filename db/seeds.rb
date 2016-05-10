require 'random_data'

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
      topic: topics.sample,
      title: "#{i}_" + RandomData.random_sentence,
      body: "#{i}_" + RandomData.random_paragraph
    )
end
posts = Post.all
puts "#{Post.count} posts created"

50.times do |i|
    SponsoredPost.create!(
      topic: topics.sample,
      title: "#{i}_" + RandomData.random_sentence,
      body: "#{i}_" + RandomData.random_paragraph,
      price: RandomData.random_price
    )
end

sponsoredposts = SponsoredPost.all
puts "#{SponsoredPost.count} sponsored posts created"

# Create Comments
100.times do |i|
  Comment.create!(
    post: posts.sample,
    body: "#{i}_" + RandomData.random_paragraph
  )
end
puts "#{Comment.count} comments created"

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{SponsoredPost.count} sponsored posts created"
