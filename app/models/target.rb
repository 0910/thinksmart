class Target < ActiveRecord::Base
	has_many :project_targets
    has_many :projects, :through => :project_targets
    has_many :post_targets
    has_many :posts, :through => :post_targets
end
