class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :url
      t.string :phone
      t.string :avatar

      t.timestamps
    end
  end
end
