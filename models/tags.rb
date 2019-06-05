require_relative('../db/sql_runner.rb')

class Tag

  attr_reader(:name, :id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags
    (name)
    VALUES
    ($1)
    RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
  end

  def update()
    sql = "UPDATE Tags SET name = ($1)
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE from tags
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

  def self.all()
    sql = "SELECT * FROM tags ORDER by name"
    tags = SqlRunner.run( sql )
    result = tags.map { |tag| Tag.new( tag )}
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Tag.new( results.first )
  end



def self.delete_all()
  sql = "DELETE from tags"
  SqlRunner.run(sql)
end




end
