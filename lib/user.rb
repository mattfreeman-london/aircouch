class User

  attr_reader :name, :email, :password

  def initialize(id, name, email, password)
    @id = id
    @name = name
    @email = email
    @password = password
  end

  def self.create(name, email, password)
    con = PG.connect(dbname: 'aircouch_test')
    results = con.exec("INSERT INTO users (name, email, password)
                        VALUES ('#{name}', '#{email}', '#{password}')
                        RETURNING id")
    id = results.values[0][0]
    user = User.new(id, name, email, password)
  end

end
