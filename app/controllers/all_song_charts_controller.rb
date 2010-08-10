class AllSongChartsController < ApplicationController
  def index
    @tab = "CHARTS"
    @song_names = "[#{Song.ordered.all.map{|s| s.name} * ","}]"
    @chart_data = SongVote.chart_data
  end
end
