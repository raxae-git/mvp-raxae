class AddDeletedGroupAndIdDeletedToDeletedMember < ActiveRecord::Migration[6.0]
  def change
    add_reference :deleted_members, :deleted_group, null: false, foreign_key: true
    add_column :deleted_members, :id_deleted, :integer
  end
end
