require 'random_data'

50.times do
    Post.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph
    )
end
posts = Post.all

# Create Comments
# #3
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by(
  title: 'GoT s6e1',
  body: 'So what did everybody think?'
  )

Comment.find_or_create_by(post: Post.find_by(title: 'GoT s6e1'), body: 'Hodor!')

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
