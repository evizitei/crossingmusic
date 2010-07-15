Given /^there is a song called "([^"]*)"$/ do |name|
  Factory(:song,:name=>name)
end

Given /^the song "([^"]*)" should have (\d+) (positive|neutral|negative) vote(?:|s)$/ do |name,count,type|
  assert_equal count.to_i,Song.find_by_name(name).song_votes.send(type.to_sym).size
end

Then /^I should see an mp3 widget for the song "([^"]*)"$/ do |song_name|
  Then %Q{I should be on the song voting page for #{song_name}}
  page.should have_css("#mp3_widget")
end

Then /^there should be an archived song called "([^"]*)"$/ do |song_name|
  assert_not_nil Song.deleted.find_by_name(song_name)
end
