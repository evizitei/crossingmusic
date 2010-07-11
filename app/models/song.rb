class Song < ActiveRecord::Base
  has_attached_file :recording,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
                    :path => ":attachment/:id/:style/:basename.:extension",
                    :bucket => S3_Bucket
end
