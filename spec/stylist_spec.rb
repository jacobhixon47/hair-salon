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

end
