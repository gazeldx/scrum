class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :url
      t.string :phone
      t.string :avatar
      t.text     "bio"
      t.string   "base"
      t.string   "work_as"
      t.timestamps
    end
  end
end
