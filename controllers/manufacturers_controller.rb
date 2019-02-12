require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/manufacturer.rb')
require_relative('../models/product.rb')
also_reload('./models/*')


get '/manufacturers' do
  @manufacturers = Manufacturer.all
  erb ( :"manufacturers/index" )
end

get '/manufacturers/new' do
  @manufacturers = Manufacturer.all
  erb(:"/manufacturers/new")
end

post '/manufacturers' do
  Manufacturer.new(params).save
  redirect to '/manufacturers'
end

get '/manufacturers/search' do
  @manufacturers = Manufacturer.all
  erb(:"manufacturers/search")
end

get '/manufacturers/search/name' do
  @manufacturer = Manufacturer.search(params["name"])
  erb (:"manufacturers/show_search")
end

get '/manufacturers/:id' do
  @manufacturer = Manufacturer.find(params['id'])
  erb( :"manufacturers/show" )
end

get '/manufacturers/:id/edit' do
  @manufacturer = Manufacturer.all
  @manufacturer = Manufacturer.find(params['id'])
  erb(:"/manufacturers/edit")
end

post '/manufacturers/:id' do
  Manufacturer.new(params).update
  redirect to "/manufacturers/#{params['id']}"
end

post '/manufacturers/:id/delete' do
  manufacturer1 = Manufacturer.find(params['id'])
  Manufacturer.delete(manufacturer1.id)
  redirect to '/manufacturers'
end
