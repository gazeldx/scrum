require 'seeder'

class CreateCourseDescriptions < ActiveRecord::Migration
  def change
    create_table :course_descriptions do |t|
      t.string :name_zh
      t.text :overview_zh
      t.text :features_zh
      t.text :bonus_zh
      t.text :audience_zh
      t.text :agenda_introduction_zh
      t.text :agenda_zh
      t.string :name_en
      t.text :overview_en
      t.text :features_en
      t.text :bonus_en
      t.text :audience_en
      t.text :agenda_introduction_en
      t.text :agenda_en


      t.timestamps
    end

    Seeder.load_fixtures(File.join(Rails.root, "db", "seeds", "course_descriptions.yml"))
  end
end
