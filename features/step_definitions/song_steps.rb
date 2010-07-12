Given /^there is a song called "([^"]*)"$/ do |name|
  Factory(:song,:name=>name)
end

Then /^I should see an mp3 widget for the song "([^"]*)"$/ do |song_name|
  page.should have_content(".swf")
end
