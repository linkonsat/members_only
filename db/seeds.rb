# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_count = 0
post_count = 0
100.times do
  user_count += 1
  User.create!(user_name: "user#{user_count}", bio: "I am user #{user_count}",
               email: "user#{user_count}@gmail.com", password: "123456789", admin: false)
end

100.times do
  post_count += 1
  Post.create!(title: 'My first post!', preview: 'I....', body: 'I am a test user', user_id: post_count)
end
