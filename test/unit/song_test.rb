require 'test_helper'

class SongTest < Test::Unit::TestCase
  should_have_attached_file :recording
  should have_many :song_votes
  
  context "song" do
    setup do
      @rand_song = Factory(:song)
      @current_top_song = Song.order("songs.placement DESC").limit(1).first
      @song = Factory(:song,:placement=>@current_top_song.placement + 1)
    end
    
    context "next method" do
      setup do
        @next_song = Factory(:song,:placement=>@song.placement + 1)
        @later_song = Factory(:song,:placement=>@next_song.placement + 1)
      end
      
      should "pick closest id greater than own id" do
        assert_equal @next_song,@song.next
      end
      
      should "pick later song if next one is no longer active" do
        @next_song.destroy
        assert_equal @later_song,@song.next
      end
      
      should "sort query by placement" do
        last_idx = -1
        Song.ordered.each do |song|
          assert song.placement >= last_idx
          last_idx = song.placement
        end
      end
    end
    
  end
  
  context "a song" do
    setup do
      @song = Factory(:song,:name=>"Great Song Name")
    end
    
    should "have next method return nil if there is no next song" do
      assert_nil @song.next
    end
    
    context "when deleted" do
      setup do
        Timecop.freeze
        @song.destroy
      end
      
      should "not be gone from database" do
        assert_not_nil Song.find(@song.id)
      end
      
      should "have deleted at stamp set" do
        assert_equal DateTime.now,@song.reload.deleted_at
      end
      
      should "be in scope for finding deleted" do
        assert_contains(Song.deleted.all,@song)
      end
      
      should "not be in scope for finding undeleted" do
        assert_does_not_contain(Song.active.all,@song) 
      end
      
      teardown do
        Timecop.return
      end
    end
 
    context "with assorted votes" do
      setup do
        Factory(:positive_vote,:song=>@song)
        2.times {Factory(:negative_vote,:song=>@song)}
        3.times {Factory(:neutral_vote,:song=>@song)}
      end
      
      should "produces valid voting json hash" do
        assert_equal "{name: 'Great Song Name',data: [1, 3, 2]}",@song.to_chart_json
      end
    end
  end
end