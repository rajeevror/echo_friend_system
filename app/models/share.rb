class Share < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
  # attr_accessible :title, :body
end
