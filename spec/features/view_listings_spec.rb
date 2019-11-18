feature 'viewing listings' do
  scenario 'user can view all listings' do
    connect = PG.connect(dbname: 'aircouch_test')
    Listing.create(name: 'Cool couch', description: 'very cool', price: 20, available_date: '2019-12-01')

    visit '/listings'
    expect(page).to have_content "Cool couch"
  end
end
