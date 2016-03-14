class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :posts

  has_attached_file :image, :styles => { :thumb => "120x120>", :large => '480x480>' },
            :url  => "/assets/users/:id/:style/:basename.:extension",
            :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
            
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

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
