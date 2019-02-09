require('pry-byebug')

class Manufacturer

  attr_reader :name
  attr_accessor :address

  def initialize(options)
    @id = options('id').to_i if options('id')
    @name = options('name')
    @address = options('address')
  end


  
end
