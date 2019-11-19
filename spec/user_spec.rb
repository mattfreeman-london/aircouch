require 'user'

describe 'users' do
  context 'making a new user' do
    it 'has a name, email and password' do
      test_user = User.create('Matt', 'matt@makers.com', 'wordpass')
      expect(test_user.name).to eq('Matt')
      expect(test_user.email).to eq('matt@makers.com')
      expect(test_user.password).to eq('wordpass')
    end
  end
end
describe '.create' do
  it 'hashes the Password using BCrypt' do
    expect(BCrypt: :Password).to receive(:create).with('password123')
    User.create(email: 'test@example.com', password: 'password123')
  end
end
