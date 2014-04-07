require 'spec_helper'

describe 'the restaurant index page' do 
  context 'no restaurants have been added' do
    it 'should display a warning message' do
      visit '/restaurants'
      expect(page).to have_content('No restaurants have been added yet')
    end

    describe 'adding a restaurant' do
    end
     
  end
end