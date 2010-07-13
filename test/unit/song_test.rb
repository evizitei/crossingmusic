require 'test_helper'

class SongTest < Test::Unit::TestCase
  should_have_attached_file :recording
  should_have_many :song_votes
  
  context "song" do
    setup do
      @rand_song = Factory(:song)
      @current_top_song = Song.order("songs.id DESC").limit(1).first
      @song = Factory(:song,:id=>@current_top_song.id + 1)
    end
    
    context "next method" do
      setup do
        @next_song = Factory(:song,:id=>@song.id + 1)
        @later_song = Factory(:song,:id=>@next_song.id + 1)
      end
      
      should "pick closest id greater than own id" do
        assert_equal @next_song,@song.next
      end
    end
  end
end