require_relative './database_connection'

if ENV['RACK'] == 'test'
  DatabaseConnection.setup("aircouch_test")
else
  DatabaseConnection.setup("aircouch")
end
