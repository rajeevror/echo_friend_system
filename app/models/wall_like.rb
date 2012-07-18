class WallLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :wall
  attr_accessible :user_id,:wall_id
  # attr_accessible :title, :body
end
