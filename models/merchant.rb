require_relative( '../db/sql_runner')

class Merchant

  attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants
    (
      name
    )
    VALUES
    (
      $1
    )
   RETURNING *"
   values= [@name]
   merchant_data = SqlRunner.run(sql, values)
   @id = merchant_data.first()['id'].to_i
 end

def self.all()
  sql = "SELECT * FROM merchants ORDER BY name"
  merchants = SqlRunner.run( sql )
  result = merchants.map { |merchant| Merchant.new( merchant )}
  return result
end

def self.find( id )
   sql = "SELECT * FROM merchants
   WHERE id = $1"
   values = [id]
   results = SqlRunner.run( sql, values )
   return Merchant.new( results.first )
 end


end
