class Friendrequest < ActiveRecord::Base
  belongs_to :user
  attr_accessible :friend_id, :status
end
