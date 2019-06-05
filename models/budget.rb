require('pg')
require('pry')
require_relative( '../db/sql_runner.rb' )

class Budget

  attr_accessor  :amount
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount']
  end


    def save()
      sql = "INSERT INTO budgets (amount)
      VALUES ($1)
      RETURNING id"
      values= [@amount]
      result = SqlRunner.run(sql, values)
      @id = result.first()['id'].to_i
   end

   def update()
     sql = "UPDATE budgets SET account = ($1)
     WHERE id = $2"
     values = [@amount, @id]
     SqlRunner.run(sql, values)
       end

   def self.find(id)
   sql = 'SELECT * FROM budgets WHERE id = $1'
   values = [id]
    result = SqlRunner.run(sql, values)
   return Budget.new(result[0])
     end


   def self.all
   sql = 'SELECT * FROM budgets'
   result = SqlRunner.run( sql )
   results = result.map { |budget| Budget.new( budget) }
   return results
   end

   def self.delete_all
     sql = "DELETE FROM budgets"
     result = SqlRunner.run(sql)
   end


end
