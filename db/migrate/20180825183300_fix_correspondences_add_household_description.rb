class FixCorrespondencesAddHouseholdDescription < ActiveRecord::Migration[5.0]
  def change
    change_column_default :correspondences, :status, 'initial'
    change_column_null :correspondences, :status, false
    add_column :households, :description, :string
  end
end
