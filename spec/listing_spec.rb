require 'listing'

describe 'Listing' do
 connection = PG.connect(dbname: 'aircouch_test')

 describe '#all' do
  it 'returns all listings' do
    connection.exec("INSERT INTO listings(name, description, price, start_date, end_date, host_id)
                    VALUES('Muna couch', 'lovely springy couch', 10, '2019-11-30', '2019-12-30', '1');")
    listings = Listing.all
    expect(listings.length).to eq 2
  end
 end

 describe '#create' do
   it 'creates a new listing' do
     listing = Listing.create('Nat couch', 'nice', 20, '2019-11-28', '2019-11-30', 1)
     expect(listing.name).to eq 'Nat couch'
   end
 end

 context "#findhost" do
   it 'finds a listing by host_id' do
     add_listing(connection)
     expect(Listing.findhost(1)[0].start_date).to eq("2019-01-01")
   end
 end
end
