class AudiosController < ApplicationController
  load_and_authorize_resource
  # GET /posts
  # GET /posts.json
  def index
    if user_signed_in?
      @audios = Audio.where(:id=>UserAudio.where(:id=>current_user.id))
    else
      @audios=nil
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audios }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @audio = Audio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @audio }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
     @audio = Audio.new
    @audio.user_id= current_user.id
    @audio.hash='1235'
    #@audio.name='my_name'
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @audio }
    end
  end

  # GET /posts/1/edit
  def edit
    @audio = Audio.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    #@post = Post.new(pupdatearams[:post])
    #@post = current_user.posts.new(params[:post])
    #@audio= current_user.audios.new(params[:audio])
    @audio= Audio.new(params[:audio])
    #@audio.user_id= current_user.id
    respond_to do |format|
      if @audio.save
        format.html { redirect_to @audio, notice: 'Post was successfully created.' }
        format.json { render json: @audio, status: :created, location: @audio }
      else
        format.html { render action: "new" }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @audio = Audio.find(params[:id])

    respond_to do |format|
      if @audio.update_attributes(params[:audio])
        format.html { redirect_to @audio, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @audio = Audio.find(params[:id])
    @audio.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
