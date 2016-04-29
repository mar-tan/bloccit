require 'random_data'

50.times do |i|
    Post.create!(
      title: "#{i}_" + RandomData.random_sentence,
      body: "#{i}_" + RandomData.random_paragraph
    )
end
posts = Post.all
puts "#{Post.count} posts created"

100.times do |i|
  Comment.create!(
    post: posts.sample,
    body: "#{i}_" + RandomData.random_paragraph
  )
end
puts "#{Comment.count} comments created"

50.times do
  Advertisement.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: RandomData.random_price
  )
end
puts "#{Advertisement.count} advertisements created"

puts "Seed finished"
