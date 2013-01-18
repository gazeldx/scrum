class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.string :company_name
      t.integer :headcount, :default => 1
      t.references :course
      t.timestamps
    end
  end
end
