class User < ActiveRecord::Base
  belongs_to :group
  attr_accessible :name, :password
end
