require 'pg'

class Listing

  attr_reader :id, :name, :description, :price, :start_date, :end_date, :host_id

  def initialize(id, name, description, price, start_date, end_date, host_id)
    @id = id
    @name = name
    @description = description
    @price = price
    @start_date = start_date
    @end_date = end_date
    @host_id = host_id
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM listings;')
    result.map { |listing|
                  Listing.new(
                    listing['id'],
                    listing['name'],
                    listing['description'],
                    listing['price'],
                    listing['start_date'],
                    listing['end_date'],
                    listing['host_id']
                  )
                }
  end

  def self.create(name, description, price, start_date, end_date, host_id)
    result = DatabaseConnection.query(
              "INSERT INTO listings(name, description, price, start_date, end_date, host_id)
              VALUES('#{name}', '#{description}', #{price}, '#{start_date}', '#{end_date}', '#{host_id}')
              RETURNING id, name, description, price, start_date, end_date, host_id;")

            Listing.new(
              result[0]['id'],
              result[0]['name'],
              result[0]['description'],
              result[0]['price'],
              result[0]['start_date'],
              result[0]['end_date'],
              result[0]['host_id']
            )
  end

  def self.findhost(host_id)
    result = DatabaseConnection.query("SELECT * FROM listings WHERE host_id = '#{host_id}';")
    result.map { |listing| Listing.new(
                  listing['id'],
                  listing['name'],
                  listing['description'],
                  listing['price'],
                  listing['start_date'],
                  listing['end_date'],
                  listing['host_id']
                )
              }
  end
end
