require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('models/animal')
require_relative('models/owner')
also_reload('./models/*')

get '/animals' do
  @animals = Animal.all
  erb(:index)
end

get '/animals/new' do
  @owners = Owner.all
  erb(:new)
end

post '/animals' do
  Animal.new(params).save
  redirect to '/animals'
end

get '/animals/:id' do
  @animal = Animal.find(params['id'])
  erb(:show)
end

get '/animals/:id/edit' do
  @owners = Owner.all
  @animal = Animal.find(params['id'])
  erb(:edit)
end

post '/animals/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to "/animals/#{params['id']}"
end

post '/animals/:id/delete' do
  animal = Animal.find(params['id'])
  animal.delete
  redirect to '/animals'
end
