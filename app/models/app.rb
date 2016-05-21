class App < ActiveRecord::Base
  belongs_to :target
  belongs_to :user
  belongs_to :city
  belongs_to :category
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

  has_many :app_targets, :dependent => :destroy
  has_many :targets, :through => :app_targets
  active_admin_translates :name, :description, :benefit, :solved_problems

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  validates :name, presence: true
  validates :name, uniqueness: true
end
