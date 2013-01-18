class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :location
      t.text :description
      t.timestamp :start_time
      t.timestamp :end_time
      t.references :trainer
      # 1:normal, 0:closed
      t.integer :status, :default => 1
      t.timestamps
    end
  end
end
