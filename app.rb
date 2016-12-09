require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

post('/stylists') do
  name = params.fetch('name')
  Stylist.new({:name => name}).save()
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id') do
  @stylist = Stylist.fine(params.fetch('id').to_i())
  erb(:stylist)
end
