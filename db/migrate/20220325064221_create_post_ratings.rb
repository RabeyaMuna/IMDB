class CreatePostRatings < ActiveRecord::Migration[7.0]
  def up
    create_table :post_ratings do |t|
      t.integer :post_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.integer :rating, null: false
    end
    add_index :post_ratings, %i[post_id user_id], unique: true
  end

  def down
    drop_table :post_ratings
  end
end
