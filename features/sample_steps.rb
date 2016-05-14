Given /^I am on (.+)$/ do |url|
  @browser.navigate.to "https://www.google.com/ncr"
end

When /^I fill in "([^"]*)" found by "([^"]*)" with "([^"]*)"$/ do |value, type, keys|
  @element = @browser.find_element(type, value)
  @element.send_keys keys
end

When /^I submit$/ do
  @element.submit
  sleep 3
end

Then /^I should see title "([^"]*)"$/ do |title|
  raise "Title match failed: [#{title}] => [#{@browser.title}]" if @browser.title != title
end
