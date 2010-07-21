class AllSongChartsController < ApplicationController
  def index
    @chart_data = "[#{Song.active.all.map{|s| s.to_chart_json}.join(",")}]"
  end
end
