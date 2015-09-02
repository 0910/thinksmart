class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.references :project_type, index: true, foreign_key: true
      t.text :description
      t.text :benefit
      t.text :solved_problems
      t.references :target, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :link
      t.references :city, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
