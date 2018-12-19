require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/animal.rb' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )

get '/animals' do
  @animals = Animal.all()
  erb ( :"animals/index" )
end

get '/animals/adoptable' do
  @animals = Animal.find_adoptable()
  erb ( :"animals/index" )
end

get '/animals/unadoptable/adopted' do
  @animals = Animal.find_adopted()
  erb ( :"animals/index" )
end

get '/animals/unadoptable/training' do
  @animals = Animal.find_training()
  erb ( :"animals/index" )
end

get '/animals/:id' do
  @animal = Animal.find(params['id'].to_i)
  erb( :"animals/show" )
end

get '/animals/:id/edit' do
  @owners = Owner.all
  @animal = Animal.find(params['id'])
  erb(:"animals/edit")
end
