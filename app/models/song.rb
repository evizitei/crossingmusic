require 'paperclip'

class Song < ActiveRecord::Base
  has_many :song_votes
  has_attached_file :recording,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
                    :path => ":attachment/:id/:style/:basename.:extension",
                    :s3_host_alias => "mp3.crossingsongs.com",
                    :url=>":s3_alias_url",
                    :bucket=>"mp3.crossingsongs.com"
  
  scope :deleted,where("songs.deleted_at is not null")
  scope :active,where("songs.deleted_at is null")
  scope :ordered,active.order("placement ASC")
                    
  def next
    Song.ordered.where("placement > #{self.placement}").limit(1).first
  end 
  
  def destroy
    update_attributes!(:deleted_at=>DateTime.now)
  end      
  
  def to_chart_json
    "{name: '#{self.name}',data: [#{song_votes.positive.size}, #{song_votes.neutral.size}, #{song_votes.negative.size}]}"
  end  
  
  #class methods
  def self.update_order!(new_order)
    transaction { new_order.each_with_index{|id,idx| update(id.to_i, :placement => idx.to_i)} }
  end      
  
end
