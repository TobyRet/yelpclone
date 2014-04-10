require 'spec_helper'

describe 'category pages' do 

  context 'with restaurants posted' do

    before do
      Restaurant.create(name: 'McDonalds', category: 'fastfood')
      Restaurant.create(name: 'Wahaca', category: 'Mexican')
    end

    describe 'the individual category page' do

      it 'displays restaurants of the same category' do

        visit '/restaurants'
        click_link('fastfood')
        expect(current_path).not_to eq '/restaurants'
        expect(page).to have_content('McDonalds')
        expect(page).not_to have_content('Mexican')

      end

    end

  end

end