class PostSubcategory < ActiveRecord::Base
  belongs_to :post
  belongs_to :subcategory
end
