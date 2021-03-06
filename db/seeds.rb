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

User.create(username: "Foodlover", email: "food@food.com", password: "password")

# 20.times do
#   Restaurant.create(name: Faker::Lorem.sentence(1), cuisine: Faker::Lorem.words(1), city: Faker::Address.city,
#   address: Faker::Address.street_address, state: Faker::Address.state_abbr,
#   zip: Faker::Address.zip, user_id: User.all.sample.id)
# end

Restaurant.create(name: "Yam.Tscha" , cuisine: "Chinese/French", city: "Paris", address: "121 Rue Saint Honoré", country: "France", zip: 75001, user_id: User.all.sample.id)

Restaurant.create(name: "108", cuisine: "Nordic", city: "Copenhagen", address: "Strandgade 108, 1401 København", country: "Denmark", user_id: User.all.sample.id)

Restaurant.create(name: "The Bunyadi", cuisine: "Vegan", city: "London", address: "18 Harper Rd", country: "England", user_id: User.all.sample.id)

Restaurant.create(name: "Odette", cuisine: "French", city: "Singapore", address: "18 Harper Rd", country: "Singapore", user_id: User.all.sample.id)

Restaurant.create(name: "Lilia", cuisine: "Italian", city: "Brooklyn", address: "567 Union Ave", state: "NY", country: "USA", user_id: User.all.sample.id)

Restaurant.create(name: "La Tasquería", cuisine: "Spanish", city: "Madrid", address: "Calle Duque de Sesto", country: "Spain", zip: 28009, user_id: User.all.sample.id)

Restaurant.create(name: "Celaravird", cuisine: "French/Scandinavian/Japanese", city: "Tokyo", address: "2-8-1 Uehara, Shibuya-ku", country: "Japan",user_id: User.all.sample.id)

Restaurant.create(name: "Gwen", cuisine: "American", city: "Los Angeles", address: "6600 Sunset Blvd.", state: "CA", country: "USA", user_id: User.all.sample.id)

Restaurant.create(name: "Shaya", cuisine: "Israeli", city: "New Orleans", address: "4213 Magazine Street", state: "LA", country: "USA", user_id: User.all.sample.id)

Restaurant.create(name: "Bad Saint", cuisine: "Filipino", city: "Washington", address: "3226 11th St. NW", state: "DC", country: "USA", user_id: User.all.sample.id)

review_subjects = ["Very good food", "Exquisite food in an elegant but relaxed setting", "Sublime", "Amazing!", "Not worth the money", "UNIQUE EXPERIENCE", "The best!! Chef is Genius!!", "Exquisite splurge!", "amazing, elegant dining", "Wowzer!", "What a 3 Michelin Star restaurant should be", "The best restaurant I have ever had the pleasure of attending.", "Stunning in all respects", "A piece of Art", "Just wow.", "Tantalising...", "Great cooking but something missing", "Unforgettable", "Spectacular and Memorable", "Wedding anniversary celebration.", "Perfection", "Wouldn't try it again", "Excellent experiencie - this is a must do, at least once in your life"]

review_content = [""]

Review.create(restaurant_id: 1,
              numerical_review: 8,
              content: "Great chinese/french fusion!",
              user_id: User.all.sample.id)

Review.create(restaurant_id: 1,
              numerical_review: 8,
              content: "Best chinese food in Paris",
              user_id: User.all.sample.id)

Review.create(restaurant_id: 1,
              numerical_review: 10,
              content: "My husband and I tried this place on our honeymoon. Great service!",
              user_id: User.all.sample.id)

100.times do
  Review.create(restaurant_id: Restaurant.all.sample.id,
                numerical_review: rand(10),
                content: Faker::Lorem.words(5),
                subject: review_subjects.sample,
                user_id: User.all.sample.id)
end
