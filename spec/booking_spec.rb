require 'booking'

describe Booking do
  start_date = "2019-8-1"
  end_date = "2019-9-1"
  let (:test_user) {double(:user, id: 1, name: "Robert", email:"test@test.com")}
  let (:test_listing) {double(:listing, id: 1, price: 30)}
  
  subject(:booking) { described_class.new(start_date, end_date)}
  # context 'Initialize' do
  #   it "has a start date" do
  #     expect(booking.start_date).to eq("2019-8-1")
  #   end

  #   it "has an end date" do
  #     expect(booking.end_date).to eq("2019-9-1")
  #   end
  # end

  context ".create" do
    it "creates a new booking" do
      expect(Booking.create(start_date, end_date, test_user.id, test_listing.id, test_listing.price)).to be_a(Booking)
    end

    it "has associated attributes" do
      test_book = Booking.create(start_date, end_date, test_user.id, test_listing.id, test_listing.price)
      expect(test_book.start_date).to eq("2019-08-01")
      expect(test_book.end_date).to eq("2019-09-01")
      expect(test_book.guest_id).to eq("1")
      expect(test_book.listing_id).to eq("1")
    end
  end
end