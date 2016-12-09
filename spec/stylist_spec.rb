require('spec_helper')

describe(Stylist) do
  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('tells you the stylists') do
      stylist = Stylist.new({:name => "Trena", :id => nil})
      expect(stylist.name()).to(eq("Trena"))
    end
  end

  describe('#id') do
    it('sets its ID when you save the stylist') do
      stylist = Stylist.new({:name => 'Trena', :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it('allows you to save stylists to the database') do
      stylist = Stylist.new({:name => 'Trena', :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe('#==') do
    it('is the same stylist if it has the same name') do
      stylist = Stylist.new({:name => 'Trena', :id => nil})
      stylist2 = Stylist.new({:name => 'Trena', :id => nil})
      expect(stylist).to(eq(stylist2))
    end
  end

  describe('.find') do
    it('returns a stylist by its ID') do
      test_stylist = Stylist.new({:name => 'Trena', :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => 'Tracy', :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe('#clients') do
    it('returns an array of the clients this stylist has') do
      test_stylist = Stylist.new({:name => 'Trena', :id => nil})
      test_stylist.save()
      test_client = Client.new({first_name: 'John', last_name: 'Smith', stylist_id: test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({first_name: 'Jane', last_name: 'Smith', stylist_id: test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe('#update') do
    it("allows user to update stylist name in database") do
      stylist = Stylist.new({:name => 'Trena', :id => nil})
      stylist.save()
      stylist.update({:name => 'Tracy'})
      expect(stylist.name()).to(eq('Tracy'))
    end
  end

  describe('#delete') do
    it('allows a user to delete a stylist from the database') do
      stylist = Stylist.new({:name => 'Trena', :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => 'Tracy', :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
    it('deletes a stylists clients from the database') do
      stylist = Stylist.new({:name => 'Trena', :id => nil})
      stylist.save()
      client = Client.new({:first_name => "Joey", :last_name => "Smith", :stylist_id => stylist.id()})
      client.save()
      client2 = Client.new({:first_name => "Jane", :last_name => "Smith", :stylist_id => stylist.id()})
      client2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([]))
    end
  end

end
