class ProjectTarget < ActiveRecord::Base
  belongs_to :project
  belongs_to :target
end
