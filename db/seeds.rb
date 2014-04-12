# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.delete_all

restaurant_list = [
  [ "McDonalds", "fastfood", "Everywhere" ],
  [ "Wahaca", "Mexican", "London" ],
  [ "KFC", "fastfood", "Everywhere" ],
  [ "Bodeans", "American", "London" ],
  [ "Subway", "fastfood", "Everywhere" ]
]

restaurants = restaurant_list.each do |restaurant| 
  restaurant = Restaurant.create( name: restaurant[0], category: restaurant[1], location: restaurant[2] )
  restaurant.reviews.create(rating: rand(1..5), comment: "Blah , blah , blah, blah, blah, blah, blah, blah, blah")
end