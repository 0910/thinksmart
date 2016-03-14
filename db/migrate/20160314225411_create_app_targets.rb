class CreateAppTargets < ActiveRecord::Migration
  def change
    create_table :app_targets do |t|
      t.references :app, index: true, foreign_key: true
      t.references :target, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
