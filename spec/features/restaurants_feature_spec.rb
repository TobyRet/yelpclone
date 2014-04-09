require 'spec_helper'

describe 'the restaurant index page' do 
  
  context 'no restaurants have been added' do
    it 'should display a warning message' do
      visit '/restaurants'
      expect(page).to have_content('No restaurants have been added yet')
    end

    describe 'adding a restaurant' do

      it 'should be listed on the index' do
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'KFC'
        fill_in 'Category', with: 'Fastfood'
        fill_in 'Location', with: 'Everywhere'
        click_button 'Create Restaurant'
        expect(current_path).to eq '/restaurants'
        expect(page).to have_content 'KFC'
      end
    end
  end

  context 'with existing restaurants' do
      
    let!(:restaurant) { Restaurant.create(:name => 'McDonalds') }

    describe 'editing a restaurant' do
      it 'should update the restaurant details' do
        visit '/restaurants'
        click_link 'Edit'
        fill_in 'Name', with: 'Old McDonalds'
        click_button 'Update Restaurant'
        expect(page).to have_content 'Old McDonalds'
      end
    end

    describe 'deleting a restaurant' do
      it 'should permanently destroy the restaurant' do
        visit '/restaurants'
        click_link 'Delete'
        expect(page).not_to have_content 'McDonalds'
        expect(page).to have_content 'Restaurant deleted successfully!'
      end
    end

    context 'with reviews posted' do
      before do
        restaurant.reviews.create(rating: 3, comment: 'Food was awful')
      end

      describe 'the individual resturant page' do
        it 'displays the review' do
          visit'/restaurants'
          click_link 'McDonalds'
          expect(page).to have_content('Food was awful')
        end
      end

      describe 'the home page' do
        it 'show latest reviews on the home page' do
          visit '/restaurants' do
          expect(page).to have_content('Food was awful')
        end
      end
    end
    end
  end
end