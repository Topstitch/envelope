class CreateLabels < ActiveRecord::Migration[5.0]
  def change
    create_table :labels do |t|
      t.string :name, null: false
      t.index :name
      t.timestamps null: false
      t.datetime :deleted_at
      t.index :deleted_at
    end
  end
end
