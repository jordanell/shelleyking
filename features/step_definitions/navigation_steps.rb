# URL Navigation
When /^I visit "([^\"]*)"$/ do |path|
  visit path
end

When /^I refresh the page$/ do
  visit current_path
end

# Clicks
When /^I follow "([^\"]*)"$/ do |link|
  click_link(link)
end

When /^I click on "([^\"]*)"$/ do |link|
  click_on(link)
end

# Forms
When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, with: value)
end

When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, from: field)
end

When /^I check "([^\"]*)"$/ do |field|
  check(field)
end

When /^I uncheck "([^\"]*)"$/ do |field|
  uncheck(field)
end

When /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end

# View Assertions
Then /^I should see "([^\"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "([^\"]*)"$/ do |text|
  page.should_not have_content(text)
end

# Location Assertions
Then /^I should be at "([^\"]*)"$/ do |url|
  URI.parse(current_url).path.should eq(url)
end

Then /^I should be redirected to "([^\"]*)"$/ do |path|
  URI.parse(current_url).path.should eq(path)
end