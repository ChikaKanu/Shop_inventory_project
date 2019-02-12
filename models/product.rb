require_relative( "../models/manufacturer.rb" )
require_relative( "../models/category.rb" )
require_relative("../db/sql_runner")
require('pry-byebug')

class Product

  attr_reader :id
  attr_accessor :name, :description, :manufacturer_id, :category_id, :quantity, :cost, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @manufacturer_id = options['manufacturer_id']
    @category_id = options['category_id']
    @quantity = options['quantity']
    @cost = options['cost'].to_i
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO products (name, description, manufacturer_id, category_id, quantity, cost, price) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id"
    values = [@name, @description, @manufacturer_id, @category_id, @quantity, @cost, @price]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def self.map_items(product_data)
    return product_data.map{|product| Product.new(product)}
  end

  def category()
    category = Category.find(@category_id)
    return category
  end

  def manufacturer()
    manufacturer = Manufacturer.find(@manufacturer_id)
    return manufacturer
  end

  def self.search_by_category(category_id)
    sql = "SELECT * FROM products WHERE category_id = $1"
    values = [category_id]
    products = SqlRunner.run(sql, values)
    return products.map{|product| Product.new(product)}
  end

  def self.search_by_manufacturer(manufacturer_id)
    sql = "SELECT * FROM products WHERE manufacturer_id = $1"
    values = [manufacturer_id]
    products = SqlRunner.run(sql, values)
    return products.map{|product| Product.new(product)}
  end

  def update()
    sql = "UPDATE products SET (name, description, manufacturer_id, :category_id quantity, cost, price) = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@name, @description, @manufacturer_id, @category_id, @quantity, @cost, @price, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM products"
    product_data = SqlRunner.run(sql)
    products = map_items(product_data)
    return products
  end

  def self.find(id)
    sql = "SELECT * FROM products WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Product.new(result)
  end

  def self.search(name)
    sql = "SELECT * FROM products WHERE name = $1"
    values = [name]
    result = SqlRunner.run(sql, values).first
    return Product.new(result)
  end

  def check_manufacturer()
    if @manufacturer_id == ''
      return true
    else
      return false
    end
  end

  def stock_level()
    sql = "SELECT * FROM products WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    product = Product.new(result)
    stock_level = product.quantity.to_i
    if stock_level <= 10
      return "Red Allert ....Low Stock"
    elsif stock_level >= 40
      return "Yellow Allert .... Medium Level Stock"
    else
      return "Green ..... In Stock"
    end
  end

  def self.delete(id)
    sql = "DELETE FROM products WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    value = [@id]
    SqlRunner.run(sql)
  end

  def mark_up
    result = @price - @cost
    return result
  end

end
