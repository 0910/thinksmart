class AddCategoryToApps < ActiveRecord::Migration
  def change
    add_reference :apps, :category, index: true, foreign_key: true
  end
end
