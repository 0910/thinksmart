class AddStoresToApps < ActiveRecord::Migration
  def change
    add_column :apps, :apple, :string
    add_column :apps, :android, :string
  end
end
