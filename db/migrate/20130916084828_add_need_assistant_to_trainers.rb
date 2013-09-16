class AddNeedAssistantToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :need_assistant, :boolean, default: true
  end
end
