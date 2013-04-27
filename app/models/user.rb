class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :creat_users_role,:create_dir_user
  before_destroy :destroy_users_role
  # Setup accessible (or protected) attributes for your model
  # attr_accessible :title, :body
  #private
  #def create_role
    #self.roles << Role.find_by_name(:user)
  #end
  def creat_users_role
    temp=UsersRole.new
    temp.user_id=self.id
    temp.role_id=Role.find_by_name('user').id
    self.users_roles<<temp
  end
  def create_dir_user
    Dir.mkdir('all/'+self.id.to_s+'/audios')
  end
  def destroy_users_role
    self.users_roles.find_by_user_id(self.id).destroy
  end
  def role
    temp=UsersRole.find_by_user_id(self.id)
    if temp
      Role.find_by_id(temp.role_id).name
    end
  end
  def role?(role)
    #return !!self.roles.find_by_name(role.to_s.camelize)
    #!!self.users_roles.role.find_by_name(role.to_s.camelize)
    #temp=UsersRole.find_by_user_id(self.id)
    #if temp
    #  Role.find_by_id(temp.role_id).name==role.to_s
    #end
    self.role==role.to_s
  end
  has_many :users_roles
  has_many :roles, :through => :users_roles
  has_many :user_audios
end
