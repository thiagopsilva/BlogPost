# Commonly used webrat steps
# http://github.com/brynary/webrat

Given(/^I have users with email (.+) and password (.+)$/) do |username, password|
  User.create!(:email => username, :password => password, :password_confirmation => password)
  User.last.update_attribute(:is_admin, false)
end

Given(/^I have admin users with email (.+) and password (.+)$/) do |username, password|
  User.create!(:email => username, :password => password, :password_confirmation => password)
  User.last.update_attribute(:is_admin, true)
end

Given /^(.*) is logged in$/ do |name|
  steps %Q{
    Given I have users with email #{name} and password password
    When I am on the signin page
    Then I should see Email
    When I fill in user_email with #{name}
    And I fill in user_password with password
    And I press Login
    Then I should see Signed in successfully
  }
end

Given /^(.*) is logged in as admin$/ do |name|
  steps %Q{
    Given I have admin users with email #{name} and password password
    When I am on the signin page
    Then I should see Email
    When I fill in user_email with #{name}
    And I fill in user_password with password
    And I press Login
    Then I should see Signed in successfully
  }
end

Given(/^I have a blog with title (.+)$/) do |title|
  BlogPost.create!(:title => title, :content => "loren ipsun sit dor amet", :author => "some author")
end

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I confirm popup$/ do
  page.driver.browser.switch_to.alert.accept
end

When /^I dismiss popup$/ do
  page.driver.browser.switch_to.alert.dismiss
end

When /^I press (.+)$/ do |button|
  click_button(button)
end

When /^I follow (.+)$/ do |link|
  click_link(link)
end

When /^I fill in (.+) with (.+)$/ do |field, value|
  fill_in(field, :with => value) 
end

When /^I select (.+) from (.+)$/ do |value, field|
  select(value, :from => field) 
end

# Use this step in conjunction with Rail's datetime_select helper. For example:
# When I select "December 25, 2008 10:00" as the date and time 
When /^I select (.+) as the date and time$/ do |time|
  select_datetime(time)
end

# Use this step when using multiple datetime_select helpers on a page or 
# you want to specify which datetime to select. Given the following view:
#   <%= f.label :preferred %><br />
#   <%= f.datetime_select :preferred %>
#   <%= f.label :alternative %><br />
#   <%= f.datetime_select :alternative %>
# The following steps would fill out the form:
# When I select "November 23, 2004 11:20" as the "Preferred" data and time
# And I select "November 25, 2004 10:30" as the "Alternative" data and time
When /^I select "([^\"]*)" as the "([^\"]*)" date and time$/ do |datetime, datetime_label|
  select_datetime(datetime, :from => datetime_label)
end

# Use this step in conjunction with Rail's time_select helper. For example:
# When I select "2:20PM" as the time
# Note: Rail's default time helper provides 24-hour time-- not 12 hour time. Webrat
# will convert the 2:20PM to 14:20 and then select it. 
When /^I select "([^\"]*)" as the time$/ do |time|
  select_time(time)
end

# Use this step when using multiple time_select helpers on a page or you want to
# specify the name of the time on the form.  For example:
# When I select "7:30AM" as the "Gym" time
When /^I select "([^\"]*)" as the "([^\"]*)" time$/ do |time, time_label|
  select_time(time, :from => time_label)
end

# Use this step in conjunction with Rail's date_select helper.  For example:
# When I select "February 20, 1981" as the date
When /^I select "([^\"]*)" as the date$/ do |date|
  select_date(date)
end

# Use this step when using multiple date_select helpers on one page or
# you want to specify the name of the date on the form. For example:
# When I select "April 26, 1982" as the "Date of Birth" date
When /^I select "([^\"]*)" as the "([^\"]*)" date$/ do |date, date_label|
  select_date(date, :from => date_label)
end

When /^I check (.+)$/ do |field|
  check(field) 
end

When /^I uncheck "([^\"]*)"$/ do |field|
  uncheck(field) 
end

When /^I choose "([^\"]*)"$/ do |field|
  choose(field)
end

When /^I attach the file at "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  attach_file(field, path)
end

Then /^I should see (.+)$/ do |text|
  page.should have_content(text)
end

Then /^I should not see (.+)$/ do |text|
  page.should_not have_content(text)
end

Then /^the "([^\"]*)" checkbox should be checked$/ do |label|
  field_labeled(label).should be_checked
end