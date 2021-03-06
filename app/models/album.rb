class Album < ActiveRecord::Base
  has_many :songs

  has_attached_file :cover, 
                    :styles => { :thumb => "100x100>"},
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root.to_s}/config/amazon_s3.yml",
                    :s3_permissions => :public_read,
                    :path => ":attachment/:style/:id.:extension"
end
