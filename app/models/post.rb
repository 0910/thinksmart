class Post < ActiveRecord::Base
  belongs_to :project_type
  belongs_to :target
  belongs_to :category
  belongs_to :city
  belongs_to :user
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  scope :category_id, -> (category_id) { where category_id: category_id }
end
