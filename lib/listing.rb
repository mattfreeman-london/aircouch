require 'pg'

class Listing

  attr_reader :id, :name, :description, :price, :start_date, :end_date

  def initialize(id, name, description, price, start_date, end_date)
    @id = id
    @name = name
    @description = description
    @price = price
    @start_date = start_date
    @end_date = end_date
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
                    listing['end_date']
                  ) 
                }
  end

  def self.create(name, description, price, start_date, end_date)
    result = DatabaseConnection.query(
              "INSERT INTO listings(name, description, price, start_date, end_date)
              VALUES('#{name}', '#{description}', #{price}, '#{start_date}', '#{end_date}')
              RETURNING id, name, description, price, start_date, end_date;")
    
            Listing.new(
              result[0]['id'], 
              result[0]['name'], 
              result[0]['description'], 
              result[0]['price'], 
              result[0]['start_date'], 
              result[0]['end_date']
            )
  end
end
