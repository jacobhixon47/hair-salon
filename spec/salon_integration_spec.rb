require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('view info for a stylist', {:type => :feature}) do
  it('allows a user to see all the clients and name of a stylist') do
    test_stylist = Stylist.new({:name => 'Trena', :id => nil})
    test_stylist.save()
    test_client = Client.new({:first_name => 'John', :last_name => 'Smith', :stylist_id => test_stylist.id()})
    test_client.save()
    visit('/stylists')
    click_link(test_stylist.name())
    expect(page).to have_content(test_client.first_name())
  end
end