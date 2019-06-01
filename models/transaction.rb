require_relative( '../db/sql_runner' )

class Transaction

  attr_reader :merchant_id, :tag_id, :amount, :id

  def initialize(options)
    @id = options["id"].to_i if options ["id"]
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options[tag_id].to_i
    @amount = options["amount"].to_i
  end

end
