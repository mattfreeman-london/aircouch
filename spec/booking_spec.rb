require 'booking'

describe Booking do
  connection = PG.connect(dbname: 'aircouch_test')
  start_date = "2019-8-1"
  end_date = "2019-9-1"
  approved = 'f'
  let (:test_user) {double(:user, id: 1, name: "Robert", email:"test@test.com")}
  let (:test_listing) {double(:listing, id: 1, price: 30)}

  # subject(:booking) { described_class.new(start_date, end_date, guest_id, listing_id)}
  context "#create" do
    it "creates a new booking" do
      expect(Booking.create(start_date, end_date, test_user.id, test_listing.id)).to be_a(Booking)
    end

    it "has associated attributes" do
      test_book = Booking.create(start_date, end_date, test_user.id, test_listing.id)
      expect(test_book.start_date).to eq("2019-08-01")
      expect(test_book.end_date).to eq("2019-09-01")
      expect(test_book.guest_id).to eq("1")
      expect(test_book.listing_id).to eq("1")
      expect(test_book.approved).to eq("f")
    end
  end

  context "#all" do
    it 'retrieves all entries from bookings' do
      add_booking(connection)
      add_booking(connection)
      expect(Booking.all.length).to eq(2)
    end
  end

  context "#find" do
    it 'finds a booking by id' do
      add_booking(connection)
      expect(Booking.find(1)[0].start_date).to eq("2019-08-01")
    end
  end

  context '#approve' do
    it 'approves booking' do
      add_booking(connection)
      Booking.new('1', start_date, end_date, approved, test_user.id, test_listing.id).approve('1')
      expect(Booking.find(1)[0].approved).to eq 't'
    end
  end
end
