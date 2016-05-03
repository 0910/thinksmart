class Post < ActiveRecord::Base
  belongs_to :project_type
  belongs_to :category
  belongs_to :city
  belongs_to :user
  belongs_to :priority

  has_many :post_targets, :dependent => :destroy
  has_many :targets, :through => :post_targets

  has_many :post_subcategories, :dependent => :destroy
  has_many :subcategories, :through => :post_subcategories

  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true
  scope :category_id, -> (category_id) { where category_id: category_id }
  active_admin_translates :title, :subtitle, :description, :benefit, :solved_problems
end
