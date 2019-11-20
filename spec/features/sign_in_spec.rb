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

feature 'authenticate' do
  scenario 'user gets a message if wrong email used' do
    User.create(name: 'Matt', email: 'matt@makers.com', password: 'wordpass')
    visit '/login'
    fill_in(:email, with: 'bob@bob.com')
    fill_in(:password, with: 'wordpass')
    click_button('Log in')
    expect(page).not_to have_content 'Welcome to AirCouch, Matt'
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'user sees an error if their password is wrong' do
    User.create(name: 'John', email: 'john@makers.com', password: 'wordpass')
    visit '/login'
    fill_in(:email, with: 'john@makers.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Log in')
    expect(page).not_to have_content 'Welcome to AirCouch, John'
    expect(page).to have_content 'Please check your email or password'
  end
end
