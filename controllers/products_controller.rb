require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/product.rb')
also_reload('./models/*')