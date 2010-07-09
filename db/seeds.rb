passwords = {:password=>"thecrossing",:password_confirmation=>"thecrossing"}

users = [{:name=>"Ethan",:email=>"ethan.vizitei@gmail.com"},{:name=>"David",:email=>"david@thecrossingchurch.com"},
         {:name=>"Tim",:email=>"tim@thecrossingchurch.com"},{:name=>"Scott",:email=>"scott@thecrossingchurch.com"}]

users.each do |parms|
  User.create!(passwords.merge(parms)) if User.find_by_email(parms[:email]).nil?
end