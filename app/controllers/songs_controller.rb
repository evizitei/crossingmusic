class SongsController < ApplicationController
  before_filter do
    @tab = "SONGS"
  end

  def index
    @album = Album.find(params[:album_id])
    @songs = @album.songs
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

  # PUT /songs/1
  # PUT /songs/1.xml
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to(@song, :notice => 'Song was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
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
end
