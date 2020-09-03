class AddDeletedBetaUserAndBetaUserToDeletedMember < ActiveRecord::Migration[6.0]
  def change
    add_reference :deleted_members, :deleted_beta_user, null: false, foreign_key: true
    add_reference :deleted_members, :beta_user, null: false, foreign_key: true
  end
end
