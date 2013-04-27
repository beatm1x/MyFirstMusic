class Upload < ActiveRecord::Base
  attr_accessible :upload
  has_attached_file :upload

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
