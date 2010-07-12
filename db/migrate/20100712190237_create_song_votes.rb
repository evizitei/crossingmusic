class CreateSongVotes < ActiveRecord::Migration
  def self.up
    create_table :song_votes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :song_votes
  end
end
