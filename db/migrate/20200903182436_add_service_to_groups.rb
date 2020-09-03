class AddServiceToGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :service, null: false, foreign_key: true
  end
end
