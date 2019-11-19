require 'booking'

describe Booking do
  subject(:booking) { described_class.new(Date.new(2019,8,1))}
  context 'Initialize' do
    it "has a start date" do
      expect(booking.start_date).to be_a(Date)
    end
  end
end