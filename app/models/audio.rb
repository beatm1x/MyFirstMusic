class Audio < ActiveRecord::Base
  attr_accessible :hash, :user_id
  after_create :create_user_audio
  def create_user_audio
    temp=UserAudio.new
    temp.audio_id=self.id
  #  temp.user_id=current_user.id
    temp.name="234234"
    self.user_audios<<temp
  end
  def name=(var)
    @name=var.to_s
  end
  def name
    @name
  end
  has_many :user_audios
  has_many :users, :through => :user_audios
end
