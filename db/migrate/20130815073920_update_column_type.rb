class UpdateColumnType < ActiveRecord::Migration
  def up
    change_column :news_and_events, :body_en, :text
  end

  def down
  end
end
