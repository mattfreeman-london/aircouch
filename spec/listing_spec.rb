require 'listing'

describe 'Listing' do
 let(:listing) { Listing.new }

 connection = PG.connect(dbname: 'aircouch_test')

 describe '#all' do
  it 'returns all listings' do
    listing = Listing.create(name: 'Muna couch', description: 'lovely, springy couch', price: 10, available_date: '2019-11-30')
    connection.exec("INSERT INTO listings(name, description, price, available_date) VALUES('Muna couch', 'lovely springy couch', 10, '2019-11-30');")
    listings = Listing.all
    expect(listings.length).to eq 2
  end
 end

 describe '#create' do
   it 'creates a new listing' do
     listing = Listing.create(name: 'Nat couch', description: 'nice', price: 20, available_date: '2019-11-28')
     expect(listing.name).to eq 'Nat couch'
   end
 end
end
