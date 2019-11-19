require 'booking'

describe Booking do
  start_date = Date.new(2019,8,1)
  end_date = Date.new(2019,8,1)
  subject(:booking) { described_class.new(start_date, end_date)}
  context 'Initialize' do
    it "has a start date" do
      expect(booking.start_date).to be_a(Date)
    end

    it "has an end date" do
      expect(booking.end_date).to be_a(Date)
    end
  end
end