class Listing

  attr_reader :name, :description, :price, :availability

  def initialize(name:, description:, price:, availability:)
    @name = name
    @description = description
    @price = price
    @availability = availability
end

  def self.all
    if ENV['RACK'] == 'test'
      connect = PG.connect(dbname: 'aircouch_test')
    else
      connect = PG.connect(dbname: 'aircouch')
    end
    result = connect.exec('SELECT * FROM listings;')
    result.map { |listing| listing['name'] }
  end
end
