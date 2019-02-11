require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/manufacturers_controller')
require_relative('controllers/products_controller')

get '/' do
  return (:index)
end
