class SongsController < ApplicationController
  before_filter do
    @tab = "SONGS"
  end

  def index
    @album = Album.find(params[:album_id])
    @songs = @album.songs.active
  end

  def new
    @album = Album.find(params[:album_id])
    @song = Song.new
  end

  def edit
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
  end

  def create
    @album = Album.find(params[:album_id])
    @song = Song.new(params[:song].merge({:album_id=>@album.id}))

    if @song.save
      redirect_to album_songs_path(@album)
    else
      render :action => "new"
    end
  end

  def update
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      redirect_to album_songs_path(@album)
    else  
      render :action => "edit"
    end
  end

  def destroy
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to album_songs_path(@album)
  end
  
  def reorder
    @songs = Song.ordered.all
  end
  
  def update_order
    Song.update_order!(params[:order])
    head :ordered
  end
  
  def show
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
  end
end
