require 'listing'

describe 'Listing' do
 connection = PG.connect(dbname: 'aircouch_test')

 describe '#all' do
  it 'returns all listings' do
    connection.exec("INSERT INTO listings(name, description, price, start_date, end_date)
                    VALUES('Muna couch', 'lovely springy couch', 10, '2019-11-30', '2019-12-30');")
    listings = Listing.all
    expect(listings.length).to eq 2
  end
 end

 describe '#create' do
   it 'creates a new listing' do
     listing = Listing.create('Nat couch', 'nice', 20, '2019-11-28', '2019-11-30')
     expect(listing.name).to eq 'Nat couch'
   end
 end

 context "#find" do
   it 'finds a listing by id' do
     add_listing(connection)
     expect(Listing.find(1)[0].start_date).to eq("2019-01-01")
   end
 end
end
