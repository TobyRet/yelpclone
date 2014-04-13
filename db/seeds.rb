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

review_examples = [
  "I would never go into another kfc as when I payed for my meal at the kingswinford store I was amazed at what I was handed , uncooked chicken on a cardboard wrap, I complained to head office and was told they would investigate and the reply letter that I received was basically stated tough we got your money and", "Whilst this was pretty ok, I've got to moan about the fact you cant book and you have to wait - that is annoying and if I were chosing the restaurant, I wouldnt eat here. But moving on past that, food good and service very good. It is also very good value for central London", "If you love meat and beer, this is the place for you!! Probably the best bbq pulled pork I have ever tasted and definitely worth another visit! It's a shame that they only take advance table bookings for 8+ people but the staff were all extremely friendly and well organised in sorting a table out for 6 people when we", "I often travel around and often like a quick subway cheap cheerful service problem is did anyone tell this place that. First off i how can you run out of bread i mean come on as am stuck with this plain bread i didn't expect my meatballs to be burnt they were horrible wish i went to greggs and had", "Bad Service, staff who swear at their customers, thugs shanked my mum, my baby drowned in the appaling gravy, my Grandmother was dead anyways but you get the point. Terrible, dissapointed and the person at the counter sexually harrased."
]

restaurants = restaurant_list.each do |restaurant| 
  restaurant = Restaurant.create( name: restaurant[0], category: restaurant[1], location: restaurant[2] )
  restaurant.reviews.create(rating: rand(1..5), comment: review_examples.sample)
end