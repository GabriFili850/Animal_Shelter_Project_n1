require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
also_reload( '../models/*' )

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end

get '/owners/find_adopted' do
  @owner = Owner.animals()
  erb( :"owners/show" )
end

get '/owners/:id' do
  @owner = Owner.find(params['id'].to_i)
  erb( :"owners/show" )
end
