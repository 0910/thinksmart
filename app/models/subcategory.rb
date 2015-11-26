class Subcategory < ActiveRecord::Base
	belongs_to :category

	has_many :post_subcategories, :dependent => :destroy
	has_many :posts, :through => :posts_subcategories

	has_many :project_subcategories, :dependent => :destroy
	has_many :projects, :through => :project_subcategories
end
