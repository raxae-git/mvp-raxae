class AddValueToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :value, :decimal
  end
end
