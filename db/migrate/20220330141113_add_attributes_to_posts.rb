class AddAttributesToPosts < ActiveRecord::Migration[7.0]
  def up
    add_column :posts, :director_name, :string
    add_column :posts, :producer_name, :string
    add_column :posts, :cast_name, :string
  end

  def down
    remove_column :posts, :director_name
    remove_column :posts, :producer_name
    remove_column :posts, :cast_name
  end
end
