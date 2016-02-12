class Sponsor < ActiveRecord::Base
	has_attached_file :image, :styles => { :thumb => "120x80>", :small => '480x320>', :medium => '720x480>', :large => '1080x720>' },
						:url  => "/assets/sponsors/:id/:style/:basename.:extension",
						:path => ":rails_root/public/assets/sponsors/:id/:style/:basename.:extension"
						
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
