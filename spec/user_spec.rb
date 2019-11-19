require 'user'

describe 'users' do
  context 'making a new user' do
    it 'adds the user to the database' do
      test_user = User.create('Matt', 'matt@makers.com', 'wordpass')
      connection = PG.connect(dbname: 'aircouch_test')
      results = connection.exec('SELECT * FROM users')
      expect(results.values[0]).to eq(["1", 'Matt','matt@makers.com','wordpass'])
    end

    it 'has a name, email and password' do
      test_user = User.create('Matt', 'matt@makers.com', 'wordpass')
      print test_user
      expect(test_user.name).to eq('Matt')
      expect(test_user.email).to eq('matt@makers.com')
      expect(test_user.password).to eq('wordpass')
    end
  end
end
