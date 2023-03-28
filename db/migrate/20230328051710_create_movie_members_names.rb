class CreateMovieMembersNames < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_members_names do |t|
      t.integer :responsible_role, null: false
      t.string :posts, :cast_name, null: false, index: true
      t.timestamps

      t.references :post, foreign_key: true, null: false, index: true
    end
  end
end
