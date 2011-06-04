class MainController < ApplicationController
  
  def home
    @tab = "HOME"
    @home_presenter = HomePresenter.new
  end
  
  def about
    @tab = "ABOUT"
  end
  
  def contact
    @tab = "CONTACT"
  end
end
