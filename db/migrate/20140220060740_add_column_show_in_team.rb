class AddColumnShowInTeam < ActiveRecord::Migration
  def up
    add_column :trainers, :show_in_team, :boolean, default: false
    Trainer.update_all(show_in_team: true)
  end

  def down
    remove_column :trainers, :show_in_team
  end
end
