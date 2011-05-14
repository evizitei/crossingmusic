class Album < ActiveRecord::Base
  has_many :songs
  has_attached_file :cover,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
                    :path => ":attachment/:id/:style/:basename.:extension",
                    :s3_host_alias => "mp3.crossingsongs.com",
                    :url=>":s3_alias_url",
                    :bucket=>"mp3.crossingsongs.com"
end
