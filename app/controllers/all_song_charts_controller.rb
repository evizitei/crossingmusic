class AllSongChartsController < ApplicationController
  def index
    @chart_data = "[#{Song.all.map{|s| s.to_chart_json}.join(",")}]"
  end
end
