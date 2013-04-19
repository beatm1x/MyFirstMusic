class PrivilegeGroup < ActiveRecord::Base
  belongs_to :group
  belongs_to :privilege
  # attr_accessible :title, :body
end
