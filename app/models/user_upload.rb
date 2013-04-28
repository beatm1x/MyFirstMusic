class UserUpload < ActiveRecord::Base
  belongs_to :user
  belongs_to :upload
  attr_accessible :user, :upload
end
