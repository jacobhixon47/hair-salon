require('spec_helper')

describe(Client) do
  describe('#==') do
    it('is the same client if it has the same first name and last name') do
      client1 = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1})
      client2 = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1})
      expect(client1).to(eq(client2))
    end
  end

  describe('#first_name') do
      it('displays the first name of the client')do
      client = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1})
      expect(client.first_name()).to(eq('John'))
    end
  end

  describe('#last_name') do
      it('displays the last name of the client') do
      client = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1})
      expect(client.last_name()).to(eq('Smith'))
    end
  end

  describe('#stylist_id') do
    it('displays the stylist id of the client') do
      client = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1})
      expect(client.stylist_id()).to(eq(1))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a client to the database') do
      test_client = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
end
