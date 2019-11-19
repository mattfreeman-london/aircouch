require 'bcrypt'

class User

  attr_reader :name, :email, :password

  def initialize(name, email, password)
    @name = name
    @email = email
    @password = password
  end

  def self.create(name, email, password)
    user = User.new(name, email, password)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users(email,password) VALUES ('#{email}', '#{encrypted_password}') RETURNING id, email")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end
end

#   # def self.create(email:, password:)
#   #   encrypted_password = BCrypt: :Password.create(password)
#   #   result = DatabaseConnection.query("INSERT INTO users(email,password) VALUES ('#{email}', '#{encrypted_password}') RETURNING id, email")
#   #   User.new(id: result[0]['id'], email: result[0]['email'])
#   # # end
#
# end
