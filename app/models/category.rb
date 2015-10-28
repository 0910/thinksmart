class Category < ActiveRecord::Base
	has_many :projects
	has_many :posts
	has_many :subcategories
	belongs_to :city
end
