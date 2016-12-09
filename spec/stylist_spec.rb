require('spec_helper')

describe(Stylist) do
  describe('.all') do
    it('starts off with no stylists') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the stylists") do
      stylist = Stylist.new({:name => "Jacob", :id => nil})
      expect(stylist.name()).to(eq("Jacob"))
    end
  end

end
