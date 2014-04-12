require 'spec_helper'

describe 'category pages' do 

  context 'with restaurants posted' do

    before do
      Restaurant.create(name: 'McDonalds', category: 'fastfood', location: 'Everywhere')
      Restaurant.create(name: 'Wahaca', category: 'Mexican', location: 'London')
    end

    describe 'a single location page' do

      it 'displays restaurants from the same location' do

        visit '/restaurants'
        click_link('London')
        expect(current_path).not_to eq '/restaurants'
        expect(page).to have_content('London')
        expect(page).not_to have_content('Nottingham')

      end

    end

  end

end