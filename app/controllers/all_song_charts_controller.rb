class AllSongChartsController < ApplicationController
  def index
    @tab = "CHARTS"
    @songs = Song.active.ordered.all
    @song_names = "[#{@songs.map{|s| s.name} * ","}]"
    @chart_data = SongVote.chart_data
  end
end
