class AddIndexForFriendlyId < ActiveRecord::Migration
  def change
    add_index :news_and_events, :slug, unique: true
  end
end
