class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.boolean :reviewed, default: false

      t.timestamps
    end
  end
end
