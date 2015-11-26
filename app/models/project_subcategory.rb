class ProjectSubcategory < ActiveRecord::Base
  belongs_to :project
  belongs_to :subcategory
end
