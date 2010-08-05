class MainController < ApplicationController
  before_filter do
    @tab = "HOME"
  end
  
  def about
    @tab = "ABOUT"
  end
end
