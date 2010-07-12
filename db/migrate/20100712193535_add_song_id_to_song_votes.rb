class AddSongIdToSongVotes < ActiveRecord::Migration
  def self.up
    add_column :song_votes, :song_id, :integer
  end

  def self.down
    remove_column :song_votes, :song_id
  end
end
