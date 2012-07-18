class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :link
  has_many :share
  has_many :comments
  has_attached_file :share_photo, :default_url => '/q.png', :styles => { :medium => "300x300>", :thumb => "100x100>" }
  attr_accessible :share_photo, :user_id
  # attr_accessible :title, :body
end
