class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :population
      t.string :man
      t.string :woman
      t.integer :ranking
      t.integer :smart_index
      t.integer :visitors
      t.integer :commitment

      t.timestamps null: false
    end
  end
end
