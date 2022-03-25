class CreateComments < ActiveRecord::Migration[7.0]
  def up
    create_table :comments do |t|
      t.integer :post_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.text :comment

      t.timestamps
    end
    add_index :comments, %i[post_id user_id], unique: true
  end

  def down
    drop_table :comments
  end
end
