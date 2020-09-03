class AddIdDeletedToDeletedBetaUser < ActiveRecord::Migration[6.0]
  def change
    add_column :deleted_beta_users, :id_deleted, :integer
  end
end
