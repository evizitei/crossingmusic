class Song < ActiveRecord::Base
  has_many :song_votes
  has_attached_file :recording,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
                    :path => ":attachment/:id/:style/:basename.:extension",
                    :bucket => S3_Bucket
                    
  def next
    Song.where("id > #{self.id}").order("songs.id ASC").limit(1).first
  end                    
end
