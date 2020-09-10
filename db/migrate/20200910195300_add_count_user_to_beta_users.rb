class AddCountUserToBetaUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :beta_users, :count_user, null: false, foreign_key: true, default: 1
  end
end
