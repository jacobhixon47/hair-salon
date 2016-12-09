class Client
  attr_reader(:first_name, :last_name, :id)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
  end

  define_method(:==) do |another_client|
    self.first_name() == another_client.first_name() && self.last_name() == another_client.last_name()
  end
end
