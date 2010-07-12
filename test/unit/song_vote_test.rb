require 'test_helper'

class SongVoteTest < Test::Unit::TestCase
  should_belong_to :song
  
  context "vote direction scope" do
    setup do
      @positive_vote = Factory(:positive_vote)
      @negative_vote = Factory(:positive_vote)
      @nuetral_vote = Factory(:positive_vote)
    end
    
    context "for positive votes" do
      setup do
        @votes = SongVote.positive.all
      end
    end
    
    context "for negative votes" do
      setup do
        @votes = SongVote.negative.all
      end
    end
    
    context "for positive votes" do
      setup do
        @votes = SongVote.neutral.all
      end
    end
  end
end