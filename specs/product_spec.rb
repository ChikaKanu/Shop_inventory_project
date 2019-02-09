require('minitest/autorun')
require('minitest/rg')
require_relative('../models/manufacturer.rb')
require_relative('../models/product.rb')

class ProductTest < Minitest::Test

  def setup
    @product1 = [{"name" => "Inspiron 120", "description" => "14inch Laptop of Golden colour", "manufacturer_id" => manufacturer2.id,
    "quantity" => 100, "cost" => 250, "price" => 400}]
    @product2 = [{"name" => "Celstin 4", "description" => "15inch HP Laptop, metallic colour", "manufacturer_id" => manufacturer3.id,
    "quantity" => 90, "cost" => 350, "price" => 500}]
    @product3 = [{"name" => "HP Pavillon 15", "description" => "15inch HP Pavillion - dark ash colour", "manufacturer_id" => manufacturer.id,
    "quantity" => 100, "cost" => 380, "price" => 560}]
    @products = Product.new(@product1, @product2, @product3)
    @manufacturer1 = [{"name" => "Bosch", "address" => "10 Ricardo Str, Edinburgh"}]
    @manufacturer2 = [{"name" => "Dell", "address" => "11 Onne Str Edinburgh"}]
    @manufacturer3 = [{"name" => "HP", "address" => "5 Tundra Avenue, Edinburgh"}]
    @manufacturers = Manufacturer.new(@manufacturer1, @manufacturer2, @manufacturer3 )
  end

end
