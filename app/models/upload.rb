class Upload < ActiveRecord::Base
  has_many :user_uploads
  has_many :users, :through => :user_uploads
  attr_accessible :upload
  has_attached_file :upload
  attr_accessible :users
  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      #"url" => upload.url('/system'),
      "delete_url" => upload_path(self),
      #"delete_url" => upload_path('/system'),
      "delete_type" => "DELETE" 
    }
  end

end
