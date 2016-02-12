class AddAdvanceToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :advance, :integer
  end
end
