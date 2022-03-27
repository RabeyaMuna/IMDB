class CreatePosts < ActiveRecord::Migration[7.0]
  def up
    create_table :posts do |t|
      t.citext :name, index: true, null: false
      t.integer :category, index: true, default: 1, null: false
      t.text :description
      t.string :link
      t.string :release_date, null: false
      t.float :score
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
