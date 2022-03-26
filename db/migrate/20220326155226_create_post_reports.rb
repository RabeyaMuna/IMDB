class CreatePostReports < ActiveRecord::Migration[7.0]
  def up
    create_table :post_reports do |t|
      t.text :message
      t.references :post, foreign_key: true, null: false, index: true
      t.references :user, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
