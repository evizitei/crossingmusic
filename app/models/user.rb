class User < ActiveRecord::Base
  #acts_as_authentic
  validates :name, :presence=>true
end
