require_relative( "../models/manufacturer.rb" )
require_relative( "../models/product.rb" )
require("pry-byebug")

# Manufacturer.delete_all()
# Product.delete_all()

manufacturer1 = Manufacturer.new({"name" => "Bosch",
  "address" => "10 Ricardo Str, Edinburgh"
})

manufacturer1.save()

manufacturer2 = Manufacturer.new({
  "name" => "Dell",
  "address" => "11 Onne Str, Edinburgh"
})

manufacturer2.save()

manufacturer3 = Manufacturer.new({
  "name" => "HP",
  "address" => "5 Tundra Avenue, Edinburgh"
})

manufacturer3.save()

manufacturer4 = Manufacturer.new({
  "name" => "Junkey",
  "address" => "7 Javis Str, Edinburgh"
})

manufacturer4.save()

manufacturer5 = Manufacturer.new({
  "name" => "Benq",
  "address" => "23 Oslo Str, Edinburgh"
})

manufacturer5.save()

manufacturer6 = Manufacturer.new({
  "name" => "Sharp",
  "address" => "20 Junsy Str, Edinburgh"
})

manufacturer6.save()

manufacturer7 = Manufacturer.new({
  "name" => "Sony",
  "address" => "1 Sony Avenue, Edinburgh"
})

manufacturer7.save()

manufacturer8 = Manufacturer.new({
  "name" => "LG",
  "address" => "89 LG Road, Edinburgh"
})

manufacturer8.save()

manufacturer9 = Manufacturer.new({
  "name" => "Ansi",
  "address" => "3 Janvasco Str, Edinburgh"
})

manufacturer9.save()

product1 = Product.new({"name" => "Inspiron 120",
"description" => "14inch Laptop of Golden colour",
"manufacturer_id" => manufacturer2.id,
"quantity" => 100,
"cost" => 250,
"price" => 400})

product1.save()

product2 = Product.new({"name" => "Celstin 4",
"description" => "15inch HP Laptop, metallic colour",
"manufacturer_id" => manufacturer3.id,
"quantity" => 90,
"cost" => 350,
"price" => 500})

product2.save()

product3 = Product.new({"name" => "HP Pavillon 15",
"description" => "15inch HP Pavillion - dark ash colour",
"manufacturer_id" => manufacturer.id,
"quantity" => 100,
"cost" => 380,
"price" => 560})

product3.save()

product4 = Product.new({"name" => "Spark 6 Pro",
"description" => "13inch Laptop Pro model with Retina Display",
"manufacturer_id" => manufacturer5.id,
"quantity" => 200,
"cost" => 280,
"price" => 450})

product4.save()

product5 = Product.new({"name" => "JavaPro 14",
"description" => "14inch JavaPro with 7th generation i8 1TB Hard Drive",
"manufacturer_id" => manufacturer7.id,
"quantity" => 8,
"cost" => 500,
"price" => 700})

product5.save()

product6 = Product.new({"name" => "HP Pavillon 17",
"description" => "17inch HP Pavillion with Retina Display",
"manufacturer_id" => manufacturer3.id,
"quantity" => 20,
"cost" => 500,
"price" => 750})

product6.save()

product7 = Product.new({"name" => "Inspiron 300",
"description" => "14inch Laptop with Retina Display",
"manufacturer_id" => manufacturer2.id,
"quantity" => 100,
"cost" => 250,
"price" => 400})

product7.save()

product8 = Product.new({"name" => "Bosch 1500",
"description" => "13inch Diaplay Laptop with dual core 1TB solid state drive",
"manufacturer_id" => manufacturer1.id,
"quantity" => 70,
"cost" => 320,
"price" => 500})

product8.save()

product9 = Product.new({"name" => "Candell 50",
"description" => "15inch Dell Laptop",
"manufacturer_id" => manufacturer2.id,
"quantity" => 55,
"cost" => 270,
"price" => 430})

product9.save()
