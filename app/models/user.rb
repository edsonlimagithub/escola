class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  belongs_to :empresa
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :empresa_id, :role_ids
  # attr_accessible :title, :body
  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end
  
end
