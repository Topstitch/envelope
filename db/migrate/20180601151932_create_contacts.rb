class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first, null: false
      t.index :first
      t.string :last
      t.index :last
      t.string :middle
      t.references :households, index: true
      t.foreign_key :households
      t.string :phone
      t.index :phone
      t.string :email
      t.index :email
      t.text :notes
      t.datetime :birthday
      t.index :birthday
      t.timestamps null: false
      t.datetime :deleted_at
      t.index :deleted_at
    end
  end
end
