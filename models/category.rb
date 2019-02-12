require_relative( "../models/product.rb" )
require_relative("../db/sql_runner")
require('pry-byebug')

class Category

  attr_reader :worth

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

  def self.delete_all()
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

end
