Factory.define :song_vote do |s|
  s.song {|e| e.association(:song)}
  s.vote "YES"
end

Factory.define :positive_vote,:parent=>:song_vote do |s|
  s.vote "YES"
end

Factory.define :negative_vote,:parent=>:song_vote do |s|
  s.vote "NO"
end

Factory.define :neutral_vote,:parent=>:song_vote do |s|
  s.vote "MEH"
end