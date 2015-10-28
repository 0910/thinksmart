class AddPriorityToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :priority, index: true, foreign_key: true
  end
end
