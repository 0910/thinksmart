class AddPhaseToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :phase, index: true, foreign_key: true
  end
end
