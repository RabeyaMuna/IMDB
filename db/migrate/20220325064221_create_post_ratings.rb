class CreatePostRatings < ActiveRecord::Migration[7.0]
  def up
    create_table :post_ratings do |t|
      t.integer :rating, null: false, default: 0
      t.references :post, foreign_key: true, null: false, index: true
      t.references :user, foreign_key: true, null: false, index: true
    end
  end

  def down
    drop_table :post_ratings
  end
end
