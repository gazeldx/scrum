class AddRemarksToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :remarks, :string
  end
end
