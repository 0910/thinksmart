class City < ActiveRecord::Base
	has_many :projects
	has_many :posts
	has_many :images, :dependent => :destroy
    accepts_nested_attributes_for :images, :allow_destroy => true
	extend FriendlyId
	friendly_id :slug, use: :slugged
end
