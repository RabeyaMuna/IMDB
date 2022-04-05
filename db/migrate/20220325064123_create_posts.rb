class CreatePosts < ActiveRecord::Migration[7.0]
  def up
    create_table :posts do |t|
      t.citext :name, index: true, null: false
      t.text :description
      t.string :link
      t.date :release_date, null: false
      t.float :score, null: false, default: 0.0
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
