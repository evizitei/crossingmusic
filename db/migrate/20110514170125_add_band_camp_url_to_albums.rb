class AddBandCampUrlToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :band_camp_url, :string
  end

  def self.down
    remove_column :albums, :band_camp_url
  end
end
