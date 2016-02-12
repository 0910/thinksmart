class AddCategory2ToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :category2, :integer
  end
end
