require_relative( "../models/product.rb" )
require_relative("../db/sql_runner")
require('pry-byebug')

class Manufacturer

  attr_reader :name
  attr_accessor :id, :address

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
  end

  def save()
    sql = "INSERT INTO manufacturers (name, address) VALUES ($1, $2) RETURNING id"
    values = [@name, @address]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def products()
    sql = "SELECT products.name, products.description FROM products WHERE products.manufacturer_id = $1"
    values = [id]
    products_data = SqlRunner.run(sql, values)
    return products_data.map{|product| Product.new(product)}
  end

  def update()
    sql = "UPDATE manufacturers SET (name, address) = ($1, $2) WHERE id = $3"
    values = [@name, @address]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM manufacturers"
    manufacturers_data = SqlRunner.run(sql)
    return manufacturers_data.map{|manufacturer| Manufacturer.new(manufacturer)}
  end

  def self.find(id)
    sql = "SELECT * FROM manufacturers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Manufacturer.new(result)
  end

  def self.delete()
    if Product.check_manufacturer == true then
    sql = "DELETE FROM manufacturers WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, values)
    else
      return "Delete failed. Unassign manufacturer to products before deleting"
    end
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end

end
