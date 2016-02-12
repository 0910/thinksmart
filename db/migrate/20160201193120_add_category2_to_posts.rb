class AddCategory2ToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category2, :integer
  end
end
