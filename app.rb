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
  Stylist.new({:name => name, :id => nil}).save()
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist)
end

get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist_edit)
end

patch('/stylists/:id') do
  name = params.fetch('new_name')
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.update({:name => name})
  erb(:stylist)
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end

# end of stylists routing


post('/clients') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  stylist_id = params.fetch('stylist_id').to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new(:first_name => first_name, :last_name => last_name, :stylist_id => stylist_id, :id => nil)
  @client.save()
  erb(:stylist)
end

get('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @my_stylist = Stylist.find(@client.stylist_id())
  erb(:client)
end

get('/clients/:id/edit') do
  @client = Client.find(params.fetch('id').to_i())
  erb(:client_edit)
end

patch('/clients/:id') do
  first_name = params.fetch('new_first_name')
  last_name = params.fetch('new_last_name')
  @client = Client.find(params.fetch('id').to_i())
  @client.update({:first_name => first_name, :last_name => last_name})
  @stylist = Stylist.find(@client.stylist_id())
  erb(:stylist)
end

delete('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @stylist = Stylist.find(@client.stylist_id())
  binding.pry
  @client.delete()
  @clients = Client.all()
  erb(:stylist)
end
