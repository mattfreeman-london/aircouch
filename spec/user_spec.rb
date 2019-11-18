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
