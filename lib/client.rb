class Client
  attr_reader(:first_name, :last_name, :stylist_id)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_method(:==) do |another_client|
    self.first_name() == another_client.first_name() && self.last_name() == another_client.last_name() && self.stylist_id() == another_client.stylist_id()
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec('SELECT * FROM clients;')
    clients = []
    returned_clients.each() do |client|
      first_name = client.fetch('first_name')
      last_name = client.fetch('last_name')
      stylist_id = client.fetch('stylist_id').to_i*
      clients.push(Client.new({:first_name => first_name, :last_name => last_name, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (first_name, last_name, stylist_id) VALUES ('#{@first_name}', '#{@last_name}', #{@stylist_id});")
  end
end
