require 'spec_helper'


describe 'Artists' do
  before(:each) do
    create(:artist)
    create(:artist2)
  end

  describe 'navigation from home page' do
    it 'displays link to artist#index page' do
      visit root_path
      # page.should have_selector('h1')
      find('h1').should have_content('HOME')
      click_link('Artists')
      find('h1').should have_content('Artists')
    end
  end

  describe 'Artists page' do
    #Test that you can get to artists#new from artists#index page
    it 'displays link to artist#new ' do
      visit artists_path
      find('h1').should have_content('Artists')
      click_link('New Artist')
      find('h1').should have_content('New Artist')
    end
  end

  describe 'New Artist page' do
    #Write a test to see whether an Artist can be created using a form on the New Artist page
    #Make the test pass
  end
end









