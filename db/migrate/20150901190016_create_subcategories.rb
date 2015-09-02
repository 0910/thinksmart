class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :title
      t.references :category
      t.integer :combination
      t.timestamps null: false
    end
  end
end
