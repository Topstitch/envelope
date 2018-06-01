class ChangePluralIdColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :addresses, :households_id, :household_id
    rename_column :contacts, :households_id, :household_id
    rename_column :correspondences, :lists_id, :list_id
  end
end
