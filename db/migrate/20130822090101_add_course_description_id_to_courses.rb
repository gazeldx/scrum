# encoding: utf-8

class AddCourseDescriptionIdToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_description_id, :integer
    course_description_ids = {
      "Jim-Wang" => 1,
      "Jens-Østergaard" => 2,
      "Hubert-Smits" => 3
    }
    Course.all.each do |c|
      c.course_description_id = course_description_ids[c.trainer.url]
      c.save
    end
  end
end
