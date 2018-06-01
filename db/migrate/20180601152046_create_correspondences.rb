class CreateCorrespondences < ActiveRecord::Migration[5.0]
  def change
    create_table :correspondences do |t|
      t.integer :from_id, null: false
      t.string :from_type
      t.integer :to_id, null: false
      t.integer :to_type
      t.string :category, null: false
      t.index :category
      t.string :occasion
      t.index :occasion
      t.string :status
      t.index :status
      t.references :lists, index: true
      t.foreign_key :lists
      t.decimal :cost, :precision => 8, :scale => 2
      t.text :notes
      t.datetime :deleted_at
      t.index :deleted_at
      t.timestamps null: false
    end
    add_index :correspondences, [:from_id, :from_type]
    add_index :correspondences, [:to_id, :to_type]
  end
end
