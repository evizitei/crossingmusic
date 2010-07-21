Given /^there is a user with name "([^"]*)", email "([^"]*)", and password "([^"]*)"$/ do |name, email, password|
  Factory(:user,:name=>name,:email=>email,:password=> password, :password_confirmation=>password)
end

Given /^I am logged in as "([^"]*)"$/ do |name|
  Given %Q{there is a user with name "#{name}", email "david.cover@gmail.com", and password "music_team"}
  And %Q{I am on the login page}
  And %Q{I fill in "Email:" with "david.cover@gmail.com"}
  And %Q{I fill in "Password:" with "music_team"}
  And %Q{I press "Login"}
end

Then /^I should see a bar chart for all songs$/ do
  page.should have_css("#all_songs_chart")
end