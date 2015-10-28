class PostTarget < ActiveRecord::Base
  belongs_to :post
  belongs_to :target
end
