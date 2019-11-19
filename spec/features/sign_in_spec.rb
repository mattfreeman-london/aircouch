require 'web_helpers'

feature 'signing in' do
  scenario 'user can sign in' do
    User.create(name: 'Matt', email: 'matt@makers.com', password: 'wordpass')
    visit '/login'
    fill_in(:email, with: 'matt@makers.com')
    fill_in(:password, with: 'wordpass')
    click_button('Log in')
    expect(page).to have_content 'Welcome to AirCouch, Matt'
  end
end
