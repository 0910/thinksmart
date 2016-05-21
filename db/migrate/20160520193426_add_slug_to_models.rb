class AddSlugToModels < ActiveRecord::Migration
  def change
  	add_column :projects, :slug, :string
  	add_column :posts, :slug, :string
  	add_column :apps, :slug, :string
  	add_column :categories, :slug, :string
  end
end
