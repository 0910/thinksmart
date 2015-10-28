class AddSubcategoryToProjects < ActiveRecord::Migration
  def change
  	add_reference :projects, :subcategory, index: true, foreign_key: true
  end
end
