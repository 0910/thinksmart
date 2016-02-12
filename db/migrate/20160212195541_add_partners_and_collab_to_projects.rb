class AddPartnersAndCollabToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :collaboration, :text
    add_column :projects, :partners, :text
  end
end
