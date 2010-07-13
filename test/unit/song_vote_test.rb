require 'test_helper'

class SongVoteTest < Test::Unit::TestCase
  should_belong_to :song
  should_validate_presence_of :vote,:song_id

  context "vote direction scope" do
    setup do
      @positive_vote = Factory(:positive_vote)
      @negative_vote = Factory(:negative_vote)
      @neutral_vote = Factory(:neutral_vote)
    end
    
    context "for positive votes" do
      setup do
        @votes = SongVote.positive.all
      end
    end
    
    context "for negative votes" do
      setup { @votes = SongVote.negative.all }
      
      should "include negative vote" do
        assert_contains @votes,@negative_vote
      end
      
      should "not include neutral vote" do
        assert_does_not_contain @votes,@neutral_vote
      end
      
      should "not include positive vote" do
        assert_does_not_contain @votes,@positive_vote
      end
    end
    
    context "for positive votes" do
      setup { @votes = SongVote.positive.all }
      
      should "not include negative vote" do
        assert_does_not_contain @votes,@negative_vote
      end
      
      should "not include neutral vote" do
        assert_does_not_contain @votes,@neutral_vote
      end
      
      should "include positive vote" do
        assert_contains @votes,@positive_vote
      end
    end
    
    context "for neutral votes" do
      setup { @votes = SongVote.neutral.all }
      
      should "not include negative vote" do
        assert_does_not_contain @votes,@negative_vote
      end
      
      should "not include neutral vote" do
        assert_contains @votes,@neutral_vote
      end
      
      should "not include positive vote" do
        assert_does_not_contain @votes,@positive_vote
      end
    end
  end
end