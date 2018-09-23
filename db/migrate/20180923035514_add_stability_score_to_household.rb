class AddStabilityScoreToHousehold < ActiveRecord::Migration[5.0]
  def change
    add_column :households, :address_stability_score, :integer, null: false, default: 0
  end
end
