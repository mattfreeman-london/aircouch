def sign_up
  visit '/users/new'
  fill_in('name', with: 'Matt')
  fill_in('email', with: 'matt@makers.com')
  fill_in('password', with: 'wordpass')
  click_button('Submit')
end