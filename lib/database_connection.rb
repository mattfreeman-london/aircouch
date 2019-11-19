require 'pg'

class DatabaseConnection
  @conn

  def self.setup(db_name)
    @conn = PG::Connection.open(:dbname => db_name )
  end

  def self.query(query)
    req  = @conn.exec(query)
  end
end