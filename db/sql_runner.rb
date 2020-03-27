require( 'pg' )
require('uri')

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({
          host: uri.host,
          dbname: uri.path[1..-1],
          user: uri.user,
          password: uri.password
         })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
