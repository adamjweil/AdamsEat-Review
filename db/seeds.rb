# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.delete_all
Review.delete_all
User.delete_all

5.times do
  User.create(username: Faker::Name.name, email: Faker::Internet.safe_email, password: "password")
end

20.times do
  Restaurant.create(name: Faker::Lorem.sentence(1), cuisine: Faker::Lorem.words(1), city: Faker::Address.city,
  address: Faker::Address.street_address, state: Faker::Address.state_abbr,
  zip: Faker::Address.zip)
end

# 100.times do
#   Review.create(restaurant_id: Restaurant.all.sample.id,
#   numerical_review: rand(10), content: Faker::Lorem.words(5))
# end
