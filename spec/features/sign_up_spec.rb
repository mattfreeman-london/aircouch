feature 'sign up' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('name', with: 'Matt')
    fill_in('email', with: 'matt@makers.com')
    fill_in('password', with: 'wordpass')
    click_button('Submit')

    expect(page).to have_content "Welcome to AirCouch, Matt"
  end
end
