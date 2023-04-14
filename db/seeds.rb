# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data ..."

User.destroy_all
user1 = User.create!({
  username: 'KojiE',
  email:  'k@e.com',
  password: '123',
  weight: 70,
  height: 175,
  age: 30,
})
user2 = User.create!({
  username: 'HarshP',
  email:  'h@p.com',
  password: '123',
  weight: 65,
  height: 170,
  age: 23,
})

user1.favourites.create!({
  recipes: ['Chicken Vesuvio', 'Chicken Paprikash']
})

user1.days.create!
user2.days.create!


puts "🌱 Seeding Completed! 🌱"
