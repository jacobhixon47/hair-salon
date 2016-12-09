require('spec_helper')

describe(Client) do
  describe('#==') do
    it('is the same client if it has the same first name and last name') do
      client1 = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1, :id => nil})
      client2 = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1, :id => nil})
      expect(client1).to(eq(client2))
    end
  end

  describe('#first_name') do
      it('displays the first name of the client')do
      client = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1, :id => nil})
      expect(client.first_name()).to(eq('John'))
    end
  end

  describe('#last_name') do
      it('displays the last name of the client') do
      client = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1, :id => nil})
      expect(client.last_name()).to(eq('Smith'))
    end
  end

  describe('#stylist_id') do
    it('displays the stylist id of the client') do
      client = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1, :id => nil})
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
      test_client = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1, :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('.find') do
    it('returns a client by its ID') do
      test_client = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1, :id => nil})
      test_client.save()
      test_client2 = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1, :id => nil})
      test_client2.save()
      expect(Client.find(test_client2.id())).to(eq(test_client2))
    end
  end

  describe('#update') do
    it("allows user to update a client in database") do
      client = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1, :id => nil})
      client.save()
      client.update({:first_name => 'Jane', :last_name => 'Doe'})
      expect(client.first_name()).to(eq('Jane'))
    end
  end

  describe('#delete') do
    it('allows a user to delete a client from the database') do
      client = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: 1, :id => nil})
      client.save()
      client2 = Client.new({first_name: 'Jane', last_name: 'Smith', stylist_id: 1, :id => nil})
      client2.save()
      client2.delete()
      expect(Client.all()).to(eq([client]))
    end
  end

end
