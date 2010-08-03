class AddOrderIndexToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :placement, :integer
  end

  def self.down
    remove_column :songs, :placement
  end
end
