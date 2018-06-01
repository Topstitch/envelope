class CreateHouseholds < ActiveRecord::Migration[5.0]
  def change
    create_table :households do |t|
      t.string :name, null: false
      t.index :name
      t.text :notes
      t.datetime :anniversary
      t.timestamps null: false
      t.datetime :deleted_at
      t.index :deleted_at
    end
  end
end
