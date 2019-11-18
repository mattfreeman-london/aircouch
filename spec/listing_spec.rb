require 'listing'

describe 'Listing' do
 # let(:listing) { Listing.new }

 connection = PG.connect(dbname: 'aircouch_test')

 describe '#all' do
   it 'returns all listings' do
     # listing = Listings.create(name: 'Muna couch', description: 'lovely, springy couch', price: 10, availability: '2019-11-30')
     connection.exec("INSERT INTO listings(name, description, price, available_date) VALUES('Muna couch', 'lovely springy couch', 10, '2019-11-30');")
     expect(Listing.all).to include "Muna couch"
   end
 end

#  describe '#create' do
#    it 'creates a new listing' do
#      Listing.create(name: 'Nat couch', description: 'nice', price: 20, availability: '29-11-2019')
#      expect
#    end
#  end
end
