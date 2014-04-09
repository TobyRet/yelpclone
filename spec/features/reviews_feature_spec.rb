require 'spec_helper'

describe 'writing reviews' do 

  before do 
    Restaurant.create(name: 'McDonalds')
  end

  it 'should change the average score of the restaurant' do
    visit '/restaurants'
    review_mcd
    expect(page).to have_css '.average_review', text: '2' 
  end

  def review_mcd
    click_link 'Review'
    fill_in 'Comment', with: 'Awful'
    select '2', from: 'Rating'
    click_button 'Create Review'
  end

end