require 'bcrypt'

class User

  attr_reader :id, :name, :email

  def initialize(id:, name:, email:)
    @id = id
    @name = name
    @email = email
  end

  def self.create(name:, email:, password:)
    if ENV['RACK'] == 'test'
      connect = PG.connect(dbname: 'aircouch_test')
    else
      connect = PG.connect(dbname: 'aircouch')
    end
    encrypted_password = BCrypt::Password.create(password)
    results = connect.exec("INSERT INTO users (name, email, password)
                        VALUES ('#{name}', '#{email}', '#{encrypted_password}')
                        RETURNING id, name, email;")

    User.new(id: results.values[0][0], name: results[0]['name'], email: results[0]['email'])
  end

  def self.find(id)
    if ENV['RACK'] == 'test'
      connect = PG.connect(dbname: 'aircouch_test')
    else
      connect = PG.connect(dbname: 'aircouch')
    end
    result = connect.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    if ENV['RACK'] == 'test'
      connect = PG.connect(dbname: 'aircouch_test')
    else
      connect = PG.connect(dbname: 'aircouch')
    end
    result = connect.exec("SELECT * FROM users WHERE email = '#{email}'")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end

end
