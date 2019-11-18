class User

  attr_reader :name, :email, :password

  def initialize(name, email, password)
    @name = name
    @email = email
    @password = password
  end

  def self.create(name, email, password)
    user = User.new(name, email, password)
  end

end
