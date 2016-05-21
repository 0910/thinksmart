class Category < ActiveRecord::Base
	has_many :projects
	has_many :posts
	has_many :apps
	has_many :subcategories
	belongs_to :city
	active_admin_translates :name, :description

	active_admin_translates :title, :subtitle, :call_to_action
	has_attached_file :image, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>', :high => '1920x1080>' },
						:url  => "/assets/categories/:id/:style/:basename.:extension",
						:path => ":rails_root/public/assets/categories/:id/:style/:basename.:extension"
						
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	extend FriendlyId
	friendly_id :name, use: :slugged
	
	validates :name, presence: true
	validates :name, uniqueness: true
end
