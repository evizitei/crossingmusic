class SongVote < ActiveRecord::Base
  belongs_to :song
  
  scope :positive, where(:vote=>"YES")
  scope :negative, where(:vote=>"NO")
  scope :neutral, where(:vote=>"MEH")
  
  validates :vote,   :presence=>true
  validates :song_id,:presence=>true
  
  def self.chart_data
    data = {:positive=>[],:neutral=>[],:negative=>[]}
    Song.ordered.each do |song|
      data[:positive] << song.song_votes.positive.size
      data[:neutral] << song.song_votes.neutral.size
      data[:negative] << song.song_votes.negative.size
    end
    "[{name: 'Positive',data: [#{data[:positive] * ","}]},{name: 'Neutral',data: [#{data[:neutral] * ","}]},{name: 'Negative',data: [#{data[:negative] * ","}]}]"
  end
end
