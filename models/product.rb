require('pry-byebug')

class Product

  attr_reader :name, :description
  attr_accessor :manufacturer_id, :quantity, :cost, :price

  def initialize(options)
    @id = options('id').to_i if options('id')
    @name = options('name')
    @description = options('description')
    @manufacturer_id = options('manufacturer_id')
    @quantity = options('quantity')
    @cost = options('cost')
    @price = options('price')
  end


end
