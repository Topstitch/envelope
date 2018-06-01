class CreateJoinTableContactLabel < ActiveRecord::Migration[5.0]
  def change
    create_join_table :contacts, :labels do |t|
      t.index [:contact_id, :label_id]
    end
  end
end
