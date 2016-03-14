class AddAppsToImages < ActiveRecord::Migration
  def change
    add_reference :images, :app, index: true, foreign_key: true
  end
end
