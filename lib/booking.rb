require_relative './setup_env_db'
require_relative 'user'

class Booking
  attr_reader :id, :start_date, :end_date, :guest_id, :listing_id, :approved

  def initialize(id, start_date, end_date, approved, guest_id, listing_id)
    @id = id
    @start_date = start_date
    @end_date = end_date
    @guest_id = guest_id
    @listing_id = listing_id
    @approved = approved
  end

  def self.create(start_date, end_date, guest_id, listing_id)
    result = DatabaseConnection.query(
              "INSERT INTO bookings(start_date, end_date, approved, guest_id, listing_id)
              VALUES('#{start_date}', '#{end_date}', false, '#{guest_id}', '#{listing_id}')
              RETURNING start_date, end_date, approved, guest_id, listing_id")

    Booking.new(result[0]['id'],
                result[0]['start_date'],
                result[0]['end_date'],
                result[0]['approved'],
                result[0]['guest_id'],
                result[0]['listing_id'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookings;")
    result.map { |booking| Booking.new(
                  booking['id'],
                  booking['start_date'],
                  booking['end_date'],
                  booking['approved'],
                  booking['guest_id'],
                  booking['listing_id']) }
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM bookings WHERE id = '#{id}';")
    result.map { |booking| Booking.new(
                  booking['id'],
                  booking['start_date'],
                  booking['end_date'],
                  booking['approved'],
                  booking['guest_id'],
                  booking['listing_id'])}
  end

  # def find_guest
  #   user = User.find(@guest_id)
  #   user.name
  # end

  def self.approve(booking_id)
    @approved = true
    DatabaseConnection.query("UPDATE bookings SET approved = TRUE WHERE id = '#{booking_id}';")
  end

  def self.findGuest(guest_id)
    result = DatabaseConnection.query("SELECT * FROM bookings WHERE guest_id = '#{guest_id}';")
    result.map { |booking| Booking.new(
                  booking['id'],
                  booking['start_date'],
                  booking['end_date'],
                  booking['approved'],
                  booking['guest_id'],
                  booking['listing_id'])}
  end

  def find_listing(listing_id)
    result = DatabaseConnection.query("SELECT * FROM listings WHERE id = '#{listing_id}';")
    result.map { |listing| Listing.new(
                  listing['id'],
                  listing['name'],
                  listing['description'],
                  listing['price'],
                  listing['start_date'],
                  listing['end_date'],
                  listing['host_id'])}
  end
end
