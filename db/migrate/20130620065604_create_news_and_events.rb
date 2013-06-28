class CreateNewsAndEvents < ActiveRecord::Migration
  def change
    create_table :news_and_events do |t|
      t.string :title
      t.text :body
      t.string :abstract
      t.datetime :posted_on
      t.string :category
      t.string :ref_link
      t.string :status
      t.string :keywords
      t.string :description
      t.string :slug

      t.timestamps
    end

    add_index :news_and_events, :title
    add_index :news_and_events, :posted_on
    add_index :news_and_events, :category
    add_index :news_and_events, :status
  end
end
