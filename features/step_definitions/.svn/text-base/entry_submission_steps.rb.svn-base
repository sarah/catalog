Given /^I am a logged in user "([^\"]*)"$/ do |user_name|
  user = activated_user :login => user_name
  visit login_path
  fill_in "login", :with => user.login
  fill_in "password", :with => user.password
  click_button "Log in >"
  categories = Category.find :all
  puts "!!!!!!!!!!!!!!!!!! Categories: #{categories.map(&:id)}"
end

Then /^there is not a publish button$/ do
  response.body.should_not contain("Publish")
end

When /^I create a new entry$/ do |table|
  entry_data = table.hashes.first
  fill_in "entry_title", :with => entry_data[:title]
  fill_in "entry_body", :with => entry_data[:body]
  select( entry_data[:category], :from => "entry_category_id") 

  click_button "Create"
end

Then /^the entry "([^\"]*)" should be pending$/ do |title|
  entry = Entry.find_by_title(title)
  entry.should be_pending
end

Given /^the pending entry$/ do |table|
  entry_data = table.hashes.first
  Factory.create(:entry, entry_data)
end

Given /^I am logged in as an admin$/ do
  user = activated_admin
  visit login_path
  fill_in "login", :with => user.login
  fill_in "password", :with => user.password
  click_button "Log in >"  
end

Then /^I should see the entry "([^\"]*)"$/ do |title|
  response.body.should include(title)
end

Then /^I should not see the Publish button$/ do
  response.body.should_not include("Publish")
end



When /^I view the entry "([^\"]*)"$/ do |title|
  entry = Entry.find_by_title(title)
  visit entry_path(entry)
end

When /^I publish "([^\"]*)"$/ do |title|
  entry = Entry.find_by_title(title)
  click_button 'Publish'
end
