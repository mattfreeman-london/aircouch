require 'web_helpers'

feature 'Create Booking' do
  scenario 'Guest can make a booking' do
    sign_up
    visit '/listings'
    click_button("book")
    fill_in('start_date', with: "01/09/2020")
    fill_in('end_date', with: "01/10/2020")
    click_button("Request")
    expect(page).to have_content("Your Booking has been requested")
  end
end