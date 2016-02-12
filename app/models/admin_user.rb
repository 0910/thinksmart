class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :projects
  has_many :posts

  # Utility methods for checking the user roles

  def role?(r)
    role.include? r.to_s
  end
  def admin?
    role == 'admin'
  end
  
  def moderator?
    role == 'moderator'
  end
  
  def user?
    role == 'user'
  end
end
