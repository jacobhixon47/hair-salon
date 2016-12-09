require('spec_helper')

describe(Client) do
  describe('#==') do
    it('is the same client if it has the same first name and last name') do
      client1 = Client.new({id: nil, first_name: 'John', last_name: 'Smith'})
      client2 = Client.new({id: nil, first_name: 'John', last_name: 'Smith'})
      expect(client1).to(eq(client2))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end
  
end
