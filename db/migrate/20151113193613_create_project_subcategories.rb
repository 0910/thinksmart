class CreateProjectSubcategories < ActiveRecord::Migration
  def change
    create_table :project_subcategories do |t|
      t.references :project, index: true, foreign_key: true
      t.references :subcategory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
