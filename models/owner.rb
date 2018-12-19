require_relative('../db/sql_runner')

class Owner

  attr_accessor :first_name, :last_name, :age
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
  end

  def full_name
    full_name = "#{@first_name} #{@last_name}"
    return full_name
  end

  def animals()
    animals = Animal.find_adopted(id)
    return animals
  end

  def save()
    sql = "INSERT INTO owners
    (
      first_name,
      last_name,
      age
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @age]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  def update()
    sql = "UPDATE owners
    SET last_name = $1
    WHERE id = $2"
    values = [@last_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM owners"
    owner_data = SqlRunner.run(sql)
    owners = map_items(owner_data)
    return owners
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def self.find(id)
    return self.new({}) if !id
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    owner = self.new(result.first)
    return owner
  end

  def self.map_items(owner_data)
    return owner_data.map { |owner| Owner.new(owner) }
  end


end
