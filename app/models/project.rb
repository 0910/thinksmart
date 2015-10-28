class Project < ActiveRecord::Base
  belongs_to :project_type
  belongs_to :category
  belongs_to :city
  belongs_to :user
  belongs_to :priority
  has_many :project_targets
  has_many :targets, :through => :project_targets
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
  scope :category_id, -> (category_id) { where category_id: category_id }
end
