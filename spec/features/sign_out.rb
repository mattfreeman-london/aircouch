feature 'sign-out' do
  scenario 'a user can sign out' do
    User.create(name: 'Time', email: 'time@bob.com', password: 'time')
    visit '/login'
    fill_in(:email, with: 'time@bob.com')
    fill_in(:password, with: 'time')
    click_button('Log in')
    click_button('Log out')
    expect(page).to have_content 'You have signed out'
    expect(page).not_to have_content 'Welcome to AirCouch, Time'
  end
end
