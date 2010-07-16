class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :song_votes,['song_id','vote'],:name=>"song_vote_main_idx"
    add_index :users,:email
  end

  def self.down
    remove_index :song_votes,:name=>"song_vote_main_idx"
    remove_index :users,:email
  end
end
