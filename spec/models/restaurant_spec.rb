require 'spec_helper'

describe Restaurant do 

  describe 'validations' do
    
    it 'is not valid without a name' do
      restaurant = Restaurant.new(name: nil)
      expect(restaurant).to have(1).errors_on(:name)
    end

    xit 'is not valid without a location' do
      restaurant = Restaurant.new(location: nil)
      expect(restaurant).to have(1).errors_on(:location)
    end

  end 

end