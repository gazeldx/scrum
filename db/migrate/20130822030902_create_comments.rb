class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body_zh
      t.string :comment_by_zh
      t.text :body_en
      t.string :comment_by_en
      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
