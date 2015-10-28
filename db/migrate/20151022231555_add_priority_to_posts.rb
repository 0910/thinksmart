class AddPriorityToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :priority, index: true, foreign_key: true
  end
end
