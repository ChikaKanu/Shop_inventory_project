require_relative( "../models/product.rb" )
require_relative("../db/sql_runner")
require('pry-byebug')

class Category

  attr_reader :worth, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @worth = options['worth']
  end

  def self.all()
    sql = "SELECT * FROM categories"
    data = SqlRunner.run(sql)
    categories = data.map{|category| Category.new(category)}
    return categories
  end

  def save()
    sql = "INSERT INTO categories (worth) VALUES ($1) RETURNING id"
    values = [@worth]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Category.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

end
