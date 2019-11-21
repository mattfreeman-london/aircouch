require 'user'

describe 'users' do
  context 'making a new user' do
    it 'adds the user to the database' do
      test_user = User.create(name: 'Matt', email: 'matt@makers.com', password: 'wordpass')
      connection = PG.connect(dbname: 'aircouch_test')
      results = connection.exec('SELECT * FROM users')
      expect(results.values[0]).to eq(["1", 'Matt','matt@makers.com','wordpass'])
    end

    it 'has a name, email and password' do
      test_user = User.create(name: 'Matt', email: 'matt@makers.com', password: 'wordpass')
      expect(test_user.name).to eq('Matt')
      expect(test_user.email).to eq('matt@makers.com')
    end
  end

  context '.authenticate' do
    it 'returns a user given correct email and password, if one exists' do
      user = User.create(name: 'Nat', email: 'nat@makers.com', password: 'password')
      authenticated_user = User.authenticate(email: 'nat@makers.com', password: 'password')
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil when an incorrect email address is used' do
      user = User.create(name: 'Nat', email: 'nat@makers.com', password: 'password')
      expect(User.authenticate(email: 'bob@bob.com', password: 'password')).to be_nil
    end

    it 'returns nil when a wrong password is used' do
      user = User.create(name: 'Nat', email: 'nat@makers.com', password: 'password')
      expect(User.authenticate(email: 'nat@makers.com', password: 'wrongpassword')).to be_nil
    end
  end
end

describe '.create' do
  it 'hashes the Password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')
    User.create(name: 'bob', email: 'test@example.com', password: 'password123')
  end
end
