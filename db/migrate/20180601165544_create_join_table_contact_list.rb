class CreateJoinTableContactList < ActiveRecord::Migration[5.0]
  def change
    create_join_table :contacts, :lists do |t|
      t.index [:contact_id, :list_id]
    end
  end
end
