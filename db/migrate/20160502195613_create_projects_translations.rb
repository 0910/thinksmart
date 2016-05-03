class CreateProjectsTranslations < ActiveRecord::Migration
  def self.up
    Project.create_translation_table!({
      :title => :string,
      :subtitle => :string,
      :description => :text,
      :benefit => :text,
      :solved_problems => :text,
      :collaboration => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Project.drop_translation_table! :migrate_data => true
  end
end
