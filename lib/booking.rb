class Booking
  attr_reader :start_date, :end_date, :guest_id, :listing_id

  def initialize(start_date, end_date, guest_id, listing_id)
    @start_date = start_date
    @end_date = end_date
    @guest_id = guest_id
    @listing_id = listing_id
  end

  def self.create(start_date, end_date, guest_id, listing_id, price)
    if ENV['RACK'] == 'test'
      connect = PG.connect(dbname: 'aircouch_test')
    else
      connect = PG.connect(dbname: 'aircouch')
    end
    result = connect.exec("INSERT INTO bookings(start_date, end_date, guest_id, listing_id) 
                          VALUES('#{start_date}', '#{end_date}', '#{guest_id}', '#{listing_id}') 
                          RETURNING start_date, end_date, guest_id, listing_id")
    Booking.new(result[0]['start_date'], result[0]['end_date'], result[0]['guest_id'], result[0]['listing_id'])
  end
end