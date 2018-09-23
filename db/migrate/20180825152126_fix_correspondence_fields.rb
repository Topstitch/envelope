class FixCorrespondenceFields < ActiveRecord::Migration[5.0]
  def change
    change_column :correspondences, :to_type, :string
    change_column_null :correspondences, :to_type, false
    change_column_null :correspondences, :from_type, false
  end
end
