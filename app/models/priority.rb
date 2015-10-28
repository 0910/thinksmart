class Priority < ActiveRecord::Base
	has_many :projects
	has_many :posts
end
