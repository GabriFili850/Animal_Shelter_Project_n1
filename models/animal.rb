require_relative('../db/sql_runner')
require('pry')

class Animal

  attr_accessor :name, :type, :admission_date, :owner_id, :adoptable
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @admission_date = options['admission_date']
    @adoptable = options['adoptable'] ? options['adoptable'] : false
    @owner_id = options['owner_id'].to_i if options['owner_id']
   end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      type,
      admission_date,
      owner_id,
      adoptable
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @type, @admission_date, @owner_id, @adoptable]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  def owner()
    owner = Owner.find(@owner_id)
    return owner
  end

  def update()
    sql = "UPDATE animals
    SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM animals"
    animal_data = SqlRunner.run(sql)
    animals = map_items(animal_data)
    return animals
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    animal = self.new(result.first)
    return animal
  end


  def self.map_items(animal_data)
    return animal_data.map { |animal| Animal.new(animal) }
  end


end
