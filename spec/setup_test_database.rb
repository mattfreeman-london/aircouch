require 'pg'

p 'Setting up test database...'

connection = PG.connect(dbname: 'aircouch_test')

connection.exec('TRUNCATE users;')
connection.exec('TRUNCATE listings;')
connection.exec('TRUNCATE bookings;')
