class CreateClassPhotos < ActiveRecord::Migration
  def change
    create_table :class_photos do |t|
      t.references :course
      t.string :avatar
      t.timestamps
    end
  end
end
