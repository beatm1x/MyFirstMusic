class UserUploadsController < ApplicationController
  # GET /user_uploads
  # GET /user_uploads.json
  def index
    if user_signed_in?
      @uploads = current_user.uploads
      #Upload.where(:users. => current_user)
    else
      @uploads=nil
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads.map{|upload| upload.to_jq_upload } }

    end
  end

end
