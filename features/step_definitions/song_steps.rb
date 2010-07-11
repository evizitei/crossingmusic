Given /^there is a song called "([^"]*)"$/ do |name|
  Factory(:song,:name=>name)
end
