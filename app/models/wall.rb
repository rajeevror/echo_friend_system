class Wall < ActiveRecord::Base
  belongs_to :user
  has_many :wall_likes
  attr_accessible :post_wall,:user_id
end
