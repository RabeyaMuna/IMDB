class CreateComments < ActiveRecord::Migration[7.0]
  def up
    create_table :comments do |t|
      t.text :comment
      t.references :post, foreign_key: true, null: false, index: true
      t.references :user, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
