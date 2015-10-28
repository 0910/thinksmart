class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.references :project, index: true, foreign_key: true
      t.references :subcategory, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
