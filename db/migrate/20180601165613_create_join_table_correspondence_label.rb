class CreateJoinTableCorrespondenceLabel < ActiveRecord::Migration[5.0]
  def change
    create_join_table :correspondences, :labels do |t|
      t.index [:correspondence_id, :label_id]
    end
  end
end
