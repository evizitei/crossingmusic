class SongVote < ActiveRecord::Base
  belongs_to :song
  
  scope :positive, where(:vote=>"YES")
  scope :negative, where(:vote=>"NO")
  scope :neutral, where(:vote=>"MEH")
  
  validates :vote,   :presence=>true
  validates :song_id,:presence=>true
end
