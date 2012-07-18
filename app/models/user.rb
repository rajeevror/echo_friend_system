class User < ActiveRecord::Base
 has_many :wall_likes
 has_many :walls
 has_many :friendrequests
 has_many :friend_added_lists
  has_attached_file :avatar, :default_url => '/q.png', :styles => { :medium => "300x300>", :thumb => "100x100>" }
  attr_accessible :city, :country, :email_id, :mobile, :password, :state, :user_name,:password_confirmation
  attr_accessible :images,:avatar
  validates :city,:country, :email_id, :password, :state, :user_name, :presence=>true
  validates :password, :confirmation => true
  validates :password_confirmation, :presence => true
  validates :mobile, :numericality=>{:only_integer=>true}

end
