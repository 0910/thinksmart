class AddCalltoactionToSplashes < ActiveRecord::Migration
  def change
    add_column :splashes, :call_to_action, :string
  end
end
