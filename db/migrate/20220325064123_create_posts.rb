class CreatePosts < ActiveRecord::Migration[7.0]
  def up
    create_table :posts do |t|
      t.citext :name, index: true, null: false
      t.integer :category, index: true, default: 1, null: false
      t.jsonb :details, default: {}
      t.string :link

      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
