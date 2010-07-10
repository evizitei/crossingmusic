class AddPaperclipFieldsToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :recording_file_name, :string
    add_column :songs, :recording_content_type, :string
    add_column :songs, :recording_file_size, :integer
    add_column :songs, :recording_updated_at, :datetime
  end

  def self.down
    remove_column :songs, :recording_updated_at
    remove_column :songs, :recording_file_size
    remove_column :songs, :recording_content_type
    remove_column :songs, :recording_file_name
  end
end
