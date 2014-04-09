require 'spec_helper'

describe Review do 

  describe 'validations' do
    
    xit 'is not valid without a comment' do
      review = Review.new(comment: nil)
      expect(review).to have(1).errors_on(:comment)
    end

    it 'is not valid if rating > 5' do
      review = Review.new(rating: 9)
      expect(review).to have(1).errors_on(:rating)
    end

    it 'is not valid if rating < 1' do
      review = Review.new(rating: -4)
      expect(review).to have(1).errors_on(:rating)
    end

  end 

end