class FixCountryCode < ActiveRecord::Migration[5.0]
  def change
    change_column_default :addresses, :country, 'USA'
  end
end
