class CreateReports < ActiveRecord::Migration[7.0]
  def up
    create_table :reports do |t|
      t.integer :comment_id, null: false, index: true
      t.text :body

      t.timestamps
    end
  end

  def down
    drop_table :reports
  end
end
