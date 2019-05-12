require 'rails_helper'
require 'support/home'

feature 'Visit homepage' do
  let(:home) { Home.new }
  scenario 'Able to see welcome text', :js => true do
    home.visit_homepage
    expect(page).to have_content('Welcome To My Blog')
  end
end