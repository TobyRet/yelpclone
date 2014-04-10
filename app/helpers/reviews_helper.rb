module ReviewsHelper

  def star_rating(rating)
    return rating unless rating.respond_to? :round
    rounded_rating = rating.round
    empty_stars = '☆' * (5 - rounded_rating)
    ('★' * rounded_rating) + empty_stars
  end
  
end
