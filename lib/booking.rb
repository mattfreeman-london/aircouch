class Booking
  attr_reader :id, :start_date, :end_date, :guest_id, :listing_id

  def initialize(id, start_date, end_date, guest_id, listing_id)
    @id = id
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
    Booking.new(result[0]['id'], result[0]['start_date'], result[0]['end_date'], result[0]['guest_id'], result[0]['listing_id'])
  end

  def self.all
    if ENV['RACK'] == 'test'
      connect = PG.connect(dbname: 'aircouch_test')
    else
      connect = PG.connect(dbname: 'aircouch')
    end
    result = connect.exec("SELECT * FROM bookings;")
    result.map { |booking| Booking.new(booking['id'], booking['start_date'], booking['end_date'], booking['guest_id'], booking['listing_id']) }
  end

  def self.find(id)
    if ENV['RACK'] == 'test'
      connect = PG.connect(dbname: 'aircouch_test')
    else
      connect = PG.connect(dbname: 'aircouch')
    end
    result = connect.exec("SELECT * FROM bookings 
                          WHERE id = '#{id}';")
    result.map { |booking| Booking.new(booking['id'], booking['start_date'], booking['end_date'], booking['guest_id'], booking['listing_id'])}
  end
end