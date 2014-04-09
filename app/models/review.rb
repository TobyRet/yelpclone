class Review < ActiveRecord::Base
  belongs_to :restaurant
  #validates :comment, presence: true
  validates :rating, inclusion: { in: [1,2,3,4,5] }

end
