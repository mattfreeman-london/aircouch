require 'pg'

def setup_test_db
  connection = PG.connect(dbname: 'aircouch_test')
  drop_tables(connection)
  create_tables(connection)
  add_user(connection)
  add_listing(connection)
end

def create_tables(connection)
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(60));")
  connection.exec("CREATE TABLE listings(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(100), price DECIMAL(6,2), start_date DATE, end_date DATE, host_id INTEGER REFERENCES users (id));")
  connection.exec("CREATE TABLE bookings(id SERIAL PRIMARY KEY, start_date DATE, end_date DATE, approved BOOLEAN, guest_id INTEGER REFERENCES users(id), listing_id INTEGER REFERENCES listings (id));")
end

def drop_tables(connection)
  connection.exec('DROP TABLE bookings;')
  connection.exec('DROP TABLE listings;')
  connection.exec('DROP TABLE users;')
end

def add_user(connection)
  connection.exec("INSERT INTO users (name, email, password) VALUES ('Matt', 'matt@makers.com', 'wordpass');")
end

def add_listing(connection)
  connection.exec("INSERT INTO listings (name, description, price, start_date, end_date, host_id)
                  VALUES ('listing_1', 'this is a couch', 20, '2019-01-01', '2019-01-02', '1');")
end

def add_booking(connection)
  start_date = "2019-8-1"
  end_date = "2019-9-1"
  connection.exec("INSERT INTO bookings (start_date, end_date, guest_id, listing_id)
  VALUES ('#{start_date}', '#{end_date}', '1', '1');")
end
