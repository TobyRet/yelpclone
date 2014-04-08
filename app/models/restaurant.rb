class Restaurant < ActiveRecord::Base
  has_many :reviews

  def average_score
    return 'No reviews' if reviews.none?
    reviews.average(:rating)
  end

end
