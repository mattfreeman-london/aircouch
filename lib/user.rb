require 'bcrypt'
require_relative './setup_env_db'

class User

  attr_reader :id, :name, :email

  def initialize(id:, name:, email:)
    @id = id
    @name = name
    @email = email
  end

  def self.create(name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    results = DatabaseConnection.query(
                "INSERT INTO users (name, email, password)
                VALUES ('#{name}', '#{email}', '#{encrypted_password}')
                RETURNING id, name, email;")

    User.new(id: results.values[0][0], name: results[0]['name'], email: results[0]['email'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end

end
