class CreatePostSubcategories < ActiveRecord::Migration
  def change
    create_table :post_subcategories do |t|
      t.references :post, index: true, foreign_key: true
      t.references :subcategory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
