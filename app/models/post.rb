class Post < ActiveRecord::Base
  belongs_to :project_type
  belongs_to :target
  belongs_to :category
  belongs_to :city
  belongs_to :user
end
