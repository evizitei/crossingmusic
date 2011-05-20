class AlbumsController < ApplicationController
  before_filter :authenticate,:except=>[:index]
  
  def index
    @tab = "SONGS"
    @albums = Album.order("created_at DESC").all
  end
  
  def new
    @album = Album.new
  end
  
  def create
    @album = Album.new(params[:album])

    if @album.save
      redirect_to albums_path
    else
      render :action => "new" 
    end
  end
  
  def edit
    @album = Album.find(params[:id])
  end
  
  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(params[:album])
      redirect_to albums_path
    else
      render :action => "edit" 
    end
  end
  
  def show
    @album = Album.find(params[:id])
  end
end
