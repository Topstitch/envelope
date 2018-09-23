class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :to, null: false
      t.index :to
      t.string :line_1, null: false
      t.string :line_2
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :country, null: false, default: "US"
      t.string :category, null: false, default: "primary"
      t.index :category
      t.references :households, index: true
      t.foreign_key :households
      t.datetime :verified_at
      t.index :verified_at
      t.text :notes
      t.timestamps null: false
      t.datetime :deleted_at
      t.index :deleted_at
    end
  end
end
