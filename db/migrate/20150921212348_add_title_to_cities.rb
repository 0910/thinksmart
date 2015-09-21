class AddTitleToCities < ActiveRecord::Migration
  def change
  	add_column :cities, :title, :string
  end
end
