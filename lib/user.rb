require 'bcrypt'

class User

  attr_reader :id, :name, :email, :password

  def initialize(id:, name:, email:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end

  def self.create(name:, email:, password:)
    if ENV['RACK'] == 'test'
      connect = PG.connect(dbname: 'aircouch_test')
    else
      connect = PG.connect(dbname: 'aircouch')
    end
    results = connect.exec("INSERT INTO users (name, email, password)
                        VALUES ('#{name}', '#{email}', '#{password}')
                        RETURNING id, name, email, password;")

    user = User.new(id: results.values[0][0], name: results[0]['name'], email: results[0]['email'], password: results[0]['password'])
  end

  def self.find(id)
    if ENV['RACK'] == 'test'
      connect = PG.connect(dbname: 'aircouch_test')
    else
      connect = PG.connect(dbname: 'aircouch')
    end
    result = connect.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
  end
end

#   # def self.create(email:, password:)
#   #   encrypted_password = BCrypt: :Password.create(password)
#   #   result = DatabaseConnection.query("INSERT INTO users(email,password) VALUES ('#{email}', '#{encrypted_password}') RETURNING id, email")
#   #   User.new(id: result[0]['id'], email: result[0]['email'])
#   # # end
#
# end
