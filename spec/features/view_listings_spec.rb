feature 'viewing listings' do
  scenario 'user can view all listings' do
    connect = PG.connect(dbname: 'aircouch_test')
    Listing.create('Cool couch', 'very cool', 20, '2019-12-01', '2019-12-30', 1)

    visit '/listings'
    expect(page).to have_content "Cool couch"
  end
end
