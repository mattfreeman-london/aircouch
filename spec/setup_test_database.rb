require 'pg'

def setup_test_db
  p 'Setting up test database...'

  connection = PG.connect(dbname: 'aircouch_test')

  connection.exec('TRUNCATE users;')
  connection.exec('DROP listings;')
  connection.exec('DROP bookings;')
end
