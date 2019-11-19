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
  connection.exec("CREATE TABLE listings(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(100), price DECIMAL(6,2), available_date DATE, host_id INTEGER REFERENCES users (id));")
  connection.exec("CREATE TABLE bookings(id SERIAL PRIMARY KEY, start_date DATE, end_date DATE, guest_id INTEGER REFERENCES users(id), listing_id INTEGER REFERENCES listings (id));")
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
  connection.exec("INSERT INTO listings (name, description, price, available_date, host_id) VALUES ('listing_1', 'this is a couch', 20, '2019-01-01', '1');")
end