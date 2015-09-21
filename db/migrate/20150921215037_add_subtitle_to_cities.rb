class AddSubtitleToCities < ActiveRecord::Migration
  def change
  	add_column :cities, :subtitle, :string
  end
end
