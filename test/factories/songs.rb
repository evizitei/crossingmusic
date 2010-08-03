Factory.sequence :song_placement do |n| 
  n
end

Factory.define :song do |s|
  s.name "Some Name"
  s.placement {Factory.next(:song_placement)}
end