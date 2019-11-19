class User

  attr_reader :name, :email, :password

  def initialize(id, name:, email:, password:)
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
    id = results.values[0][0]
    user = User.new(id, name: results[0]['name'], email: results[0]['email'], password: results[0]['password'])
  end

end
