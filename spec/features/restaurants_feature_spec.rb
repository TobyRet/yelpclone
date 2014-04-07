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
end