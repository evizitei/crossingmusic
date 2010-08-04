Given /^there is a song called "([^"]*)"$/ do |name|
  Factory(:song,:name=>name)
end

Given /^there is a song called "([^"]*)" in position (\d+)$/ do |name, placement|
  Given %Q{there is a song called "#{name}"}
  Song.find_by_name(name).update_attributes!(:placement=>placement)
end

Given /^there is a song called "([^"]*)" with "([^"]*)" (positive|neutral|negative) votes$/ do |name, count, type|
  Given %Q{there is a song called "#{name}"}
  song = Song.find_by_name(name)
  count.to_i.times { Factory("#{type}_vote".to_sym,:song=>song) }
end

Given /^there are no songs to start with$/ do
  Song.delete_all
end

Then /^the song "([^"]*)" should have (\d+) (positive|neutral|negative) vote(?:|s)$/ do |name,count,type|
  assert_equal count.to_i,Song.find_by_name(name).song_votes.send(type.to_sym).size
end

Then /^the song "([^"]*)" should have (\d+) archived (positive|neutral|negative) vote(?:|s)$/ do |name,count,type|
  vote = case type 
  when "positive" then "YES"
  when "negative" then "NO"
  when "neutral"  then "MEH"
  end
  song = Song.find_by_name(name)
  assert_equal count.to_i,SongVote::Archive.where({:song_id=>song_id,:vote=>vote}).size
end

Then /^I should see an mp3 widget for the song "([^"]*)"$/ do |song_name|
  Then %Q{I should be on the song voting page for #{song_name}}
  Then %Q{I should see an mp3 widget}
end

Then /^I should see an mp3 widget$/ do
  page.should have_css("#mp3_widget")
end

Then /^there should be an archived song called "([^"]*)"$/ do |song_name|
  assert_not_nil Song.deleted.find_by_name(song_name)
end
