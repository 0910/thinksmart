class CreatePostTargets < ActiveRecord::Migration
  def change
    create_table :post_targets do |t|
      t.references :post, index: true, foreign_key: true
      t.references :target, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
