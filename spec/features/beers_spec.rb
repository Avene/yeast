require 'rails_helper'

# RSpec.describe "Beers", :type => :request do
#   describe "GET /beers" do
#     it "works! (now write some real specs)" do
#       get beers_path
#       expect(response.status).to be(200)
#     end
#   end
# end

feature 'sign up as new user' do
  scenario 'sign up as new user' do
    visit root_path
    # find('.dropdown-toggle').click_link 'Sign in'
    find('.dropdown-menu').click_link 'Sign in'
    click_link 'Sign up'

    expect {
      fill_in 'Email', with: 'test@example.com'
      find('.user_password').fill_in 'Password', with: 'good_password'

      find('.user_password_confirmation').fill_in 'Password confirmation', with: 'good_password'

      fill_in 'Name', with: 'Jonathan Joester'

      click_button 'Sign up'
      save_and_open_page

    }.to change(User, :count).by(1)

    save_and_open_page
  end
end