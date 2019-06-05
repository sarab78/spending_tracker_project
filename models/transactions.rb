require('pg')
require('pry')
require_relative( '../db/sql_runner.rb' )

class Transaction

  attr_accessor :merchant_id, :tag_id, :amount, :id, :timestamp
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @amount = options['amount'].to_i
    @timestamp = options['timestamp']
  end


  def save()
    sql = "INSERT INTO transactions
    (
      merchant_id,
      tag_id,
      amount,
      timestamp
    )
    VALUES
    ($1, $2, $3, $4)
    RETURNING id"
  values = [@merchant_id, @tag_id, @amount, @timestamp]
  result = SqlRunner.run(sql, values)
  @id = result.first()['id'].to_i
end

def update
    sql = 'UPDATE transactions SET
    (amount, time_stamp, merchant_id, tag_id
    ) =
    ($1, $2, $3, $4) WHERE id = $5'
    values = [@amount, @timestamp, @merchant_id, @tag_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


def self.calculate_total_amount()
  total = 0
  all_transactions = Transaction.all()
  all_transactions.each{ |transaction| total += transaction.amount}
  return total
end

def self.calculate_total_by_merchant()
  total = 0
  merchant_transactions = Transaction.merchant()
  merchant_transactions.each{ |transaction| total += transaction.amount}
  return total
end

def self.calculate_total_by_tag()
  total = 0
  tag_transactions = Transaction.tag()
  tag_transaction.each{ |transaction| total += transaction.amount}
  return total
end

def tag()
  sql = "SELECT * FROM tags WHERE id = $1"
  values = [@tag_id]
  tag = SqlRunner.run(sql, values).first
  return Tag.new(tag)
end

def merchant()
  sql = "SELECT * FROM merchants WHERE id = $1"
  values = [@merchant_id]
  merchant = SqlRunner.run(sql, values).first
  return Merchant.new(merchant)
end

def self.find(id)
    sql = 'SELECT * FROM transactions WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values)
    return Transaction.new(result[0])
  end

  def self.all
    sql = 'SELECT * FROM transactions'
    transactions = SqlRunner.run(sql)
    result = transactions.map { |transaction| Transaction.new( transaction ) }
    return result
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    result = SqlRunner.run(sql)
  end


  end
