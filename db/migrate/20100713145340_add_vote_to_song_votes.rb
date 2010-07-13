class AddVoteToSongVotes < ActiveRecord::Migration
  def self.up
    add_column :song_votes, :vote, :string
  end

  def self.down
    remove_column :song_votes, :vote
  end
end
