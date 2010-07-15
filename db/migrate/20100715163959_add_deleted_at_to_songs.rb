class AddDeletedAtToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :deleted_at, :datetime
  end

  def self.down
    remove_column :songs, :deleted_at
  end
end
