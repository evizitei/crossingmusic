Given /^there is a user with name "([^"]*)", email "([^"]*)", and password "([^"]*)"$/ do |name, email, password|
  Factory(:user,:name=>name,:email=>email,:password=> password, :password_confirmation=>password)
end