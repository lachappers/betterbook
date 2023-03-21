# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'factory_bot_rails'
require 'faker'

50.times do
    FactoryBot.create(:user_with_profile)
    
end

p "Created #{User.count} users and profiles"

100.times do 
    Post.create(
        content: Faker::TvShows::FamilyGuy.quote,
        user_id: rand(1..50)
    )

end

200.times do
    Comment.create(
        content: Faker::TvShows::Friends.quote,
        user_id: rand(1..50),
        post_id: rand(1..100)
    )
end

150.times do
    comment = Comment.find(rand(1..200))
    Comment.create(
        content: Faker::TvShows::Simpsons.quote,
        user_id: rand(1..50),
        parent: comment,
        post: comment.post
    )
end

p "Created #{Post.count} posts and #{Comment.count} comments"