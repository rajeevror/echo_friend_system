class FriendAddedList < ActiveRecord::Base
  belongs_to :user
  attr_accessible :friend_id
end
