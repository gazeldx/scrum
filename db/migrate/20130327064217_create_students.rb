class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :title
      t.string :train_type
      t.references :trainer
      t.string :trainer_type
      t.string :avatar

      t.timestamps
    end
  end
end
