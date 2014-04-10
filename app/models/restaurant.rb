class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  #validates :location, presence: true

  def average_score
    return 'No reviews' if reviews.none?
    reviews.average(:rating).round
  end

end
