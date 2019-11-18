require 'pg'

def setup_test_db
  p 'Setting up test database...'
  connection = PG.connect(dbname: 'aircouch_test')
  drop_tables(connection)
  create_tables(connection)

end

def create_tables(connect)
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(60));")
  connection.exec("CREATE TABLE listings(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(100), price DECIMAL(6,2), available_date DATE, user_id INTEGER REFERENCES users (id));")
  connection.exec("CREATE TABLE bookings(id SERIAL PRIMARY KEY, date DATE, listing_id INTEGER REFERENCES listings (id));")
end

def drop_tables(connection)
  connection.exec('DROP users;')
  connection.exec('DROP listings;')
  connection.exec('DROP bookings;')
end