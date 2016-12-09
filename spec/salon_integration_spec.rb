require('capybara/rspec')
require('./app')
require('pry')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('view info for a stylist', {:type => :feature}) do
  it('allows a user to see all the clients and name of a stylist') do
    test_stylist = Stylist.new({:name => 'Trena', :id => nil})
    test_stylist.save()
    test_client = Client.new({:first_name => 'John', :last_name => 'Smith', :stylist_id => test_stylist.id(), :id => nil})
    test_client.save()
    visit('/stylists')
    click_link(test_stylist.name())
    expect(page).to have_content(test_client.first_name())
  end
end

describe('add clients to a stylist', {:type => :feature}) do
  it('allows a user to add a client to a stylist') do
    test_stylist = Stylist.new({:name => 'Trena', :id => nil})
    test_stylist.save()
    visit("/stylists/#{test_stylist.id()}")
    fill_in("first_name", {:with => "John"})
    fill_in("last_name", {:with => "Smith"})
    click_button('Add Client')
    expect(page).to have_content("John")
  end
end

describe('add stylists', {:type => :feature}) do
  it('allows the user to add a stylist to list of stylists') do
    visit('/stylists')
    fill_in('name', :with => 'Trena')
    click_button('Add Stylist')
    expect(page).to have_content('Trena')
  end
end

describe('update stylists', {:type => :feature}) do
  it('allows the user to update the name of a stylist') do
    visit('/stylists')
    fill_in('name', :with => 'Trena')
    click_button('Add Stylist')
    click_link('Trena')
    click_link('Edit Trena')
    fill_in('new_name', :with => 'Tracy')
    click_button('Update')
    expect(page).to have_content('Tracy')
  end
end

describe('delete a stylist', {:type => :feature}) do
  it('allows the user to delete a stylist') do
    visit('/stylists')
    fill_in('name', :with => 'Trena')
    click_button('Add Stylist')
    click_link('Trena')
    click_button('Delete Trena')
    expect(page).to have_content('no stylists yet!')
  end
end

describe('update clients', {:type => :feature}) do
  it('allows the user to update the name of a client') do
    visit('/stylists')
    fill_in('name', :with => 'Trena')
    click_button('Add Stylist')
    click_link('Trena')
    fill_in('first_name', :with => 'John')
    fill_in('last_name', :with => 'Smith')
    click_button('Add Client')
    click_link("Smith, John")
    click_link('Edit')
    fill_in('new_first_name', :with => 'Jane')
    fill_in('new_last_name', :with => 'Williams')
    click_button('Update')
    expect(page).to have_content('Jane')
  end
end
