require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/product.rb')
require_relative('../models/manufacturer.rb')
require_relative('../models/category.rb')
also_reload('./models/*')

get '/products' do
  @products = Product.all
  erb(:"products/index")
end

get '/products/new' do
  @products = Product.all
  @manufacturers = Manufacturer.all
  @categories = Category.all
  erb(:"products/new")
end

get '/products/new/feedback' do
  @products = Product.all
  erb(:"products/index_fb")
end

post '/products' do
  Product.new(params).save
  redirect to '/products/new/feedback'
end

get '/products/delete/feedback' do
  @products = Product.all
  erb(:"products/index_delete_fb")
end

get '/products/search' do
  @products = Product.all
  @manufacturers = Manufacturer.all
  @categories = Category.all
  erb(:"products/search")
end

get '/products/search/name' do
    @Product = Product.search(params["name"].to_s)
    erb (:"products/show_search")
end

get '/products/search/manufacturer' do
  @products = Product.search_by_manufacturer(params['manufacturer_id'].to_i)
  erb (:"products/show_search_manufacturer")
end

get '/products/search/category' do
  @products = Product.search_by_category(params["category_id"].to_i)
  erb (:"products/show_search_category")
end

get '/products/:id' do
  @product = Product.find(params['id'])
  erb(:"products/show")
end

get '/products/:id/edit' do
  @manufacturers = Manufacturer.all
  @categories = Category.all
  @product = Product.find(params['id'])
  erb(:"products/edit")
end

post '/products/:id' do
  Product.new(params).update
  redirect to "/products/#{params['id']}"
end

post '/products/:id/delete' do
  product1 = Product.find(params['id'])
  Product.delete(product1.id)
  redirect to '/products/delete/feedback'
end
