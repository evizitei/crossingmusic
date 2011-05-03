class MainController < ApplicationController
  before_filter do
    @tab = "HOME"
  end
  
  def about
    @tab = "ABOUT"
  end
  
  def contact
    @tab = "CONTACT"
  end
end
