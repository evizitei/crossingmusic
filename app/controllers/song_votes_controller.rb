class SongVotesController < ApplicationController
  # GET /song_votes
  # GET /song_votes.xml
  def index
    @song_votes = SongVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @song_votes }
    end
  end

  # GET /song_votes/1
  # GET /song_votes/1.xml
  def show
    @song_vote = SongVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @song_vote }
    end
  end

  # GET /song_votes/new
  # GET /song_votes/new.xml
  def new
    @song_vote = SongVote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @song_vote }
    end
  end

  # GET /song_votes/1/edit
  def edit
    @song_vote = SongVote.find(params[:id])
  end

  # POST /song_votes
  # POST /song_votes.xml
  def create
    @song_vote = SongVote.new(params[:song_vote])

    respond_to do |format|
      if @song_vote.save
        format.html { redirect_to(@song_vote, :notice => 'Song vote was successfully created.') }
        format.xml  { render :xml => @song_vote, :status => :created, :location => @song_vote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song_vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /song_votes/1
  # PUT /song_votes/1.xml
  def update
    @song_vote = SongVote.find(params[:id])

    respond_to do |format|
      if @song_vote.update_attributes(params[:song_vote])
        format.html { redirect_to(@song_vote, :notice => 'Song vote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @song_vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /song_votes/1
  # DELETE /song_votes/1.xml
  def destroy
    @song_vote = SongVote.find(params[:id])
    @song_vote.destroy

    respond_to do |format|
      format.html { redirect_to(song_votes_url) }
      format.xml  { head :ok }
    end
  end
end
