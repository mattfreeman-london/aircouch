feature 'create listings' do
  scenario 'user can create listings' do
    visit '/listings/new'
    fill_in('name', with: 'Rob couch')
    fill_in('description', with: 'big airbed')
    fill_in('price', with: 10)
    fill_in('available_date', with: '2019-11-20')
    click_button 'Submit'
    expect(page).to have_content('Rob couch, big airbed, £10.00, available: 2019-11-20')
  end
end
