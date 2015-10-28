class CreateProjectTargets < ActiveRecord::Migration
  def change
    create_table :project_targets do |t|
      t.references :project, index: true, foreign_key: true
      t.references :target, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
