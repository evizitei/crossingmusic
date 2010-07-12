Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :user do |u|
  u.name "David"
  u.email {Factory.next(:email)}
  u.password "thecrossing"
  u.password_confirmation "thecrossing"
end