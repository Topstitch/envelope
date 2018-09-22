class FixReservedWordIssueInAddress < ActiveRecord::Migration[5.0]
  def change
    rename_column :addresses, :to, :recipient
  end
end
