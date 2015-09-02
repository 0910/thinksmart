class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string   :file_file_name
      t.string   :file_content_type
      t.integer  :file_file_size
      t.datetime :file_updated_at
      t.references  :post, index: true, foreign_key: true
      t.references  :project, index: true, foreign_key: true
      t.references  :city, index: true, foreign_key: true
      t.references  :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
