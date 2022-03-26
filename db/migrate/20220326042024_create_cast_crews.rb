class CreateCastCrews < ActiveRecord::Migration[7.0]
  def up
    create_table :cast_crews do |t|
      t.integer :cast_type, index: true, default: 0, null: false
      t.citext :name, index: true, null: false
      t.references :post, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end

  def down
    drop_table :cast_crews
  end
end
