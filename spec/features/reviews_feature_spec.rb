require 'spec_helper'

describe 'writing reviews' do 

  context 'with reviews posted' do
    
    before do
      restaurant = Restaurant.create(name: 'McDonalds')
      restaurant.reviews.create(rating: 3, comment: 'Food was awful')
    end

    describe 'the individual restaurant page' do
      it 'displays the review' do
        visit'/restaurants'
        click_link 'McDonalds'
        expect(page).to have_content('Food was awful')
      end

      it 'displays the rating' do
        visit'/restaurants'
        click_link 'McDonalds'
        expect(page).to have_content('Food was awful')
      end

    end

    describe 'the home page' do
      it 'show latest reviews on the home page' do
        visit '/restaurants' 
        expect(page).to have_content('Food was awful')
      end
    end

  end
end