class Target < ActiveRecord::Base
	has_many :project_targets, :dependent => :destroy
    has_many :projects, :through => :project_targets
    
    has_many :post_targets, :dependent => :destroy
    has_many :posts, :through => :post_targets

    has_many :app_targets, :dependent => :destroy
    has_many :apps, :through => :app_targets
end
