class CreateAppsTranslations < ActiveRecord::Migration
  def self.up
    App.create_translation_table!({
      :name => :string,
      :description => :text,
      :benefit => :text,
      :solved_problems => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    App.drop_translation_table! :migrate_data => true
  end
end
