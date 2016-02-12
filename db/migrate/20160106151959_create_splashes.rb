class CreateSplashes < ActiveRecord::Migration
  def change
    create_table :splashes do |t|
      t.string :title
      t.string :subtitle
      t.string :link

      t.timestamps null: false
    end
  end
end
