class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :company
      t.text :body
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
