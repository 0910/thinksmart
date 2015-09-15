class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.references :project_type_id, index: true, foreign_key: true
      t.text :description
      t.text :benefit
      t.text :solved_problems
      t.references :target_id, index: true, foreign_key: true
      t.references :category_id, index: true, foreign_key: true
      t.string :link
      t.references :city_id, index: true, foreign_key: true
      t.references :user_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
