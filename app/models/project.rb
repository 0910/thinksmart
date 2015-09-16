class Project < ActiveRecord::Base
  belongs_to :project_type
  belongs_to :target
  belongs_to :category
  belongs_to :city
  belongs_to :user
  has_many :subcategories
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
end
