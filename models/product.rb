require_relative( "../models/manufacturer.rb" )
require_relative("../db/sql_runner")
require('pry-byebug')

class Product

  attr_reader :id
  attr_accessor :name, :description, :manufacturer_id, :quantity, :cost, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @manufacturer_id = options['manufacturer_id']
    @quantity = options['quantity']
    @cost = options['cost']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO products (name, description, manufacturer_id, quantity, cost, price) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@name, @description, @manufacturer_id, @quantity, @cost, @price]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def self.map_items(product_data)
    return product_data.map{|product| Product.new(product)}
  end

  def manufacturers()
    sql = "SELECT * FROM manufacturers WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|manufacturer| Manufacturer.new(manufacturer)}
  end

  def self.update()
    sql = "UPDATE products SET (name, description, manufacturer_id, quantity, cost, price) = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM products"
    product_data = SqlRunner.run(sql, values)
    products = map_items(product_data)
    return products
  end

  def self.find()
    sql = "SELECT FROM products WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Manufacturer.new(result)
  end

  def check_manufacturer()
    if @manufacturer_id == ''
      return true
    else
      return false
    end
  end

  def check_stock_level
    if @quantity < 10
      return "Red Allert ....Low Stock"
    elsif 10 <= @quantity <= 40
      return "Yellow Allert .... Medium Level Stock"
    else
      return "Green ..... In Stock"
    end
  end

  def self.delete()
    sql = "DELETE FROM products WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    value = [@id]
    SqlRunner.run(sql)
  end


end
