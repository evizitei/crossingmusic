class AllSongChartsController < ApplicationController
  def index
    @chart_data = "[#{Song.ordered.all.map{|s| s.to_chart_json}.join(",")}]"
  end
end
