require 'random_data'

50.times do
    Post.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph
    )
end
posts = Post.all
puts "#{Post.count} posts created"

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
puts "#{Comment.count} comments created"

Post.find_or_create_by(
  title: 'GoT s6e1',
  body: 'So what did everybody think?'
  )

Comment.find_or_create_by(post: Post.find_by(title: 'GoT s6e1'), body: 'Hodor!')

puts "Seed finished"
