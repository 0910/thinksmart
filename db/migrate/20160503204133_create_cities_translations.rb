class CreateCitiesTranslations < ActiveRecord::Migration
  def self.up
    City.create_translation_table!({
      :title => :string,
      :subtitle => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    City.drop_translation_table! :migrate_data => true
  end
end
