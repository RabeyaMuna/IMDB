class CreateReports < ActiveRecord::Migration[7.0]
  def up
    create_table :reports do |t|
      t.text :body
      t.references :comment, foreign_key: true, null: false, index: true
      t.references :user, foreign_key: true, null: false, index: true

      t.timestamps
    end
    add_index :reports, %i[comment_id user_id], unique: true
  end

  def down
    drop_table :reports
  end
end
